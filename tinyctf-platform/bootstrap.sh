S0="${BASH_SOURCE[0]}"
DIRNAME="$( dirname "$S0")"
DIR="$( cd "$DIRNAME" && pwd)"

cd $DIR
python task_import.py
python user_import.py
python server.py
