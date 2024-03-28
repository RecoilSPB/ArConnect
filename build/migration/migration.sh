#!/bin/sh
cd /db/migration/ || { echo "Failed to change directory. Exiting script."; exit 1; }
pwd
for file in *; do
  if [ -f "$file" ]; then
    psql -U arcrm -d ArTest -a -f "${file}"
  fi
done