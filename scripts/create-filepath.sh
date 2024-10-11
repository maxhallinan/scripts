if [[ "$#" -ne 1 ]]; then
  echo "Usage: $0 <filepath>" >&2
  exit 1
fi
mkdir -p "$(dirname "$1")" && touch "$1"
