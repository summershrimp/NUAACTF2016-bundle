#!/bin/bash
S0="${BASH_SOURCE[0]}"
DIRNAME="$( dirname "$S0")"
DIR="$( cd "$DIRNAME" && pwd)"

cd $DIR

while true
do
echo Start querying...
mysql --user=root --password="030405hjcduemn398ch7823rc" --host="127.0.0.1" -D platform <<-EOF

select u.username, u.showname team, t.id taskid, t.name taskname, f.timestamp time
from flags f 
left join users u 
on u.id = f.user_id 
left join tasks t 
on t.id = f.task_id
order by f.timestamp desc limit 20;
EOF

sleep 5;

done

