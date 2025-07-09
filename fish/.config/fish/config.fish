# custom greeting
set KERNEL (uname -r)
set fish_greeting (set_color --bold efcf40)">"(set_color ef9540)"<"(set_color ea3838)">" \
  (set_color normal)"fish $FISH_VERSION" \
  (set_color normal)"| $KERNEL"

function fish_user_key_bindings
  fish_vi_key_bindings

  # set kj to <Esc>
  bind -M insert -m default kj backward-char force-repaint
end
function clr
  clear
  fastfetch
end
# remove default clock
function fish_right_prompt
  echo (set_color 71717a)""
end
function fishy
  code ~/.config/fish/config.fish
end
function spaceship
  swww img Pictures/wallpapers/pixel-jeff-galaxy-far-far-away.gif 
end
function astro
  swww img Pictures/wallpapers/mylivewallpapers.com-Spaceman-Jellyfish-4K.gif 
end

function hacker
  swww img Pictures/wallpapers/hacker.gif
end
# indicator for vi
function fish_mode_prompt
  switch "$fish_bind_mode"
    case "default"
      echo -n (set_color --bold f43f5e)""
    case "insert"
      echo -n (set_color --bold 7209b7)""
    case "visual"
      echo -n (set_color --bold 8b5cf6)""
    case "*"
      echo -n (set_color --bold)"?"
   end

  echo -n " "
end
function tubefetch
  node Documents/Coding/tubefetch/index.js
end
function cybrpnk 
    kitty --detach --hold -e cava &
    kitty --detach --hold -e cmatrix &
    kitty --detach --hold -e htop &
end
function hkr
    kitty --detach --hold -e globe -sc5 -i &
    kitty --detach --hold -e mapscii &
    kitty --detach --hold -e cmatrix &
    
end
function cc 
    code dotfiles/cava/.config/cava/config
    code Documents/Configuration
end
function spotify_song
    set song (playerctl metadata --format "{{ artist }} - {{ title }}" 2>/dev/null)
    if test -z "$song"
        echo " "
    else
        echo "♫ $song"
    end
end
function next
  playerctl next
end
# custom prompt
function fish_prompt
  set_color --bold 4086ef

  set transformed_pwd (prompt_pwd | string replace -r "^~" (set_color --bold 06b6d4)"~"(set_color --bold 3b82f6))
  echo -n (spotify_song)
  echo -n " "
  echo -n $transformed_pwd

  # git branch  
  if git rev-parse --is-inside-work-tree >/dev/null 2>&1
    #space
    echo -n " "

    echo -n (set_color --bold 4338ca)"("

    set_color f0abfc
    echo -n (git branch --show-current)

    echo -n (set_color --bold 4338ca)")"
    set_color normal
  end

  # space
  echo -n " "

  # arrows
  # echo -n (set_color --bold efcf40)"❱"
  # echo -n (set_color --bold ef9540)"❱"
  # echo -n (set_color --bold ea3838)"❱"
  
  echo -n (set_color --bold 14b8a6)"→"
  
  #space
  echo -n " "

  set_color normal
end

# set environment variables
set -x PATH $PATH:/usr/local/bin:/opt/bin

# set editor
set -x EDITOR "code"

set QT_QPA_PLATFORM xcb

# fzf
# export FZF_DEFAULT_OPTS="
# --bind='ctrl-j:down,ctrl-k:up,ctrl-t:toggle-all,ctrl-v:toggle-preview,ctrl-space:toggle-preview'
# --color=fg:#ffffff,hl:#00ff00,fg+:#a5b4fc,bg+:#737373,hl+:#ffff00,info:#14b8a6,spinner:#00ffff,pointer:#f59e0b
# "

alias ls "exa --icons"
alias treelist "tree -a -I '.git'"

# TokyoNight Color Palette from https://github.com/folke/tokyonight.nvim/blob/main/extras/fish/tokyonight_storm.fish
set -l foreground c0caf5
# changed from default
set -l selection 6366f1
# changed from default
set -l comment 737373
set -l red bd1523
set -l orange ff9e64
set -l yellow FFEF00
set -l green 9ece6a
set -l purple 6925CE
set -l cyan 7dcfff
set -l pink bb9af7
set -l lightblue 01FDFE
set -l lightpurple AA55FF
set -l darkpurple 6925CE



# Syntax Highlighting Colors
set -g fish_color_normal $foreground
set -g fish_color_command $lightblue
set -g fish_color_keyword $lightpurple
set -g fish_color_quote $yellow
set -g fish_color_redirection $foreground
set -g fish_color_end $orange
set -g fish_color_error $red
set -g fish_color_param $purple
set -g fish_color_comment $comment
set -g fish_color_selection --background=$selection
set -g fish_color_search_match --background=$selection
set -g fish_color_operator $darkpurple
set -g fish_color_escape $pink
set -g fish_color_autosuggestion $comment

# Completion Pager Colors
set -g fish_pager_color_progress $comment
set -g fish_pager_color_prefix $cyan
set -g fish_pager_color_completion $foreground
set -g fish_pager_color_description $comment
set -g fish_pager_color_selected_background --background=$selection
function change_wallpaper

    set wallpaper (find Pictures/wallpapers -type f | shuf -n 1)

    swww img $wallpaper
end



function wallpapr
  while true
    change_wallpaper

    sleep 30
  end
end
# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

# pnpm
set -gx PNPM_HOME "~/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end

zoxide init fish | source

if status is-interactive         
    fortune | cowsay     
end



fish_add_path /home/mingche/.spicetify





# Created by `pipx` on 2025-07-03 20:30:21
set PATH $PATH /home/mingche/.local/bin
