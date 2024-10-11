if [[ "$#" -ne 1 ]]; then
  command_name=$(basename "$0")
  echo "Usage: $command_name <Homebrew formulae>" >&2
  echo "Example: $command_name postgresql@14" >&2
  exit 1
fi

postgres_formulae="$1"
data_directory="$HOMEBREW_PREFIX/var/$postgres_formulae"
postmaster_pid="$data_directory/postmaster.pid"

pg_ctl status --pgdata="$data_directory"

if [[ $? -ne 3 ]]; then
  echo "Error: Postgres is not stopped." >&2
  exit 1
fi

if [[ ! -f $postmaster_pid ]]; then
  echo "Error: $postmaster_pid file does not exist." >&2
  exit 1
fi

rm "$postmaster_pid"
brew services restart "$postgres_formulae"
