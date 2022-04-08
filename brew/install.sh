set -e

function install_homebrew_dependencies() {
  if ! which brew &>/dev/null; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> "$HOME/.zprofile"
    eval "$(/opt/homebrew/bin/brew shellenv)"
  fi

  brew tap homebrew/cask-fonts || true
  brew install --quiet --cask authy rectangle visual-studio-code spotify android-studio notion hyper slack font-ubuntu-mono-nerd-font || true
  brew install --quiet vim git nodenv rbenv jenv react-native-debugger starship jq bat lsd fd hyperfine delta yarn ffmpeg imagemagick || true
}

install_homebrew_dependencies
cp ./.rndebuggerrc ~/.rndebuggerrc
