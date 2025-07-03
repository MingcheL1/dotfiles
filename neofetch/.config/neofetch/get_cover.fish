#!/usr/bin/env fish

#displays current music album cover as neofetch image
set fallback_folder "$HOME/neofetch-images"
set fallback_image (find $fallback_folder -type f | shuf -n 1)
set cache_dir "/tmp/spotify_album"
mkdir -p $cache_dir

set spotify_status (playerctl --player=spotify status 2>/dev/null)

if test "$spotify_status" = "Playing" -o "$spotify_status" = "Paused"
    set artist (playerctl --player=spotify metadata xesam:artist)
    set title (playerctl --player=spotify metadata xesam:title)

 
    set safe_title (string replace -a ' ' '_' -- "$title")
    set safe_artist (string replace -a ' ' '_' -- "$artist")
    set cover_path "$cache_dir/$safe_artist-$safe_title.jpg"

    if not test -f "$cover_path"
        set url (playerctl --player=spotify metadata mpris:artUrl | sed 's/^file:\/\///')

        if string match -qr '^http' -- $url
            curl -s "$url" -o "$cover_path"
        else if test -f "$url"
            cp "$url" "$cover_path"
        else
            cp "$fallback_image" "$cover_path"
        end
    end

    echo "$cover_path"
else
    echo "$fallback_image"
end
