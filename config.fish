
set -x PATH /home/linuxbrew/.linuxbrew/bin:$HOME/.fnm:$HOME/windows_commands:$HOME/.dotnet:$PATH

if test -d (brew --prefix)"/share/fish/completions"
    set -gx fish_complete_path $fish_complete_path (brew --prefix)/share/fish/completions
end

if test -d (brew --prefix)"/share/fish/vendor_completions.d"
    set -gx fish_complete_path $fish_complete_path (brew --prefix)/share/fish/vendor_completions.d
end
set -x GOPATH $HOME/go
set -x GOROOT $HOME/.go
set -x PATH $GOPATH/bin $PATH
