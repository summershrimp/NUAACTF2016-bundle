S0="${BASH_SOURCE[0]}"
DIRNAME="$( dirname "$S0")"
DIR="$( cd "$DIRNAME" && pwd)"

cd $DIR
./pwn3.elf
