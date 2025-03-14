if status is-interactive
    # Commands to run in interactive sessions can go here
	source ~/.config/fish/functions/lolfish.fish
end

fish_add_path $HOME/yandex-cloud/bin/
fish_add_path $HOME/.cabal/bin
fish_add_path $HOME/.ghcup/bin

# set -x http_proxy http://127.0.0.1:10809
