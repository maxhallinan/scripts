if [[ "$#" -ne 1 ]]; then
  command_name=$(basename "$0")
  echo "Usage: $command_name <Homebrew formulae>
For example, $command_name postgresql@14" >&2
  exit 1
fi
brew services stop "$1"
rm "$HOMEBREW_PREFIX/var/$1/postmaster.pid"
brew services restart "$1"
