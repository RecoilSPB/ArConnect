#!/bin/sh
cd /db/schema/ || { echo "Failed to change directory. Exiting script."; exit 1; }
pwd
for file in *; do
  if [ -f "$file" ]; then
    new_file="${file}_new.sql"
    sed 's/${userName}/arcrm/g; s/${pass}/elsoft/g' "$file" >"$new_file"

    psql -U arcrm -d ArTest -a -f "$new_file"
  fi
done
