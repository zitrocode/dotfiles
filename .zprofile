# Homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# PATH & Language Enviroments
export PATH="/opt/homebrew/opt/ruby/bin:$PATH"

export JAVA_HOME="/Library/Java/JavaVirtualMachines/zulu-17.jdk/Contents/Home"

export ANDROID_HOME="$HOME/Library/Android/sdk"
export PATH="$PATH:$ANDROID_HOME/emulator"
export PATH="$PATH:$ANDROID_HOME/platform-tools"

#Bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# pipx
export PATH="$PATH:$HOME/.local/bin"
