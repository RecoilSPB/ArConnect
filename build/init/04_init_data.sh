#!/bin/sh

cd /db/data/ || { echo "Failed to change directory. Exiting script."; exit 1; }
pwd
# Параметр командной строки с помощью файла JSON
json_file=regions.json

# Вытаскиваем данные из JSON-файла и вставляем их в базу данных PostgreSQL
jq -c '.records[] | {name: .data.SUBJECT, code: .data.CODE_FNS}' $json_file | while IFS= read -r region; do
  name=$(echo $region | jq -r '.name')
  code=$(echo $region | jq -r '.code')

  # Выполнение вставки данных в базу данных через psql
  query="INSERT INTO region (id, code, text, code_reg) SELECT nextval('s_region'), gen_random_uuid(),'$name', 'ru'||'$code';"
  echo $query
  psql -U arcrm -d ArTest -c "$query"
done

json_file=organization.json

# Вытаскиваем данные из JSON-файла и вставляем их в базу данных PostgreSQL
jq -c '.projects[] | {id: .id, name: .name, identifier: .identifier}' $json_file | while IFS= read -r organization; do
  id=$(echo $organization | jq -r '.id')
  name=$(echo $organization | jq -r '.name')
  code=$(echo $organization | jq -r '.identifier' | sed -e "s/'/''/g") # Экранируем управляющие символы

  # Выполнение вставки данных в базу данных через psql (замените на ваши значения)
  query="INSERT INTO organization (id, code, text, region_id, customer_code) SELECT nextval('s_organization'),
  gen_random_uuid(),'$name', (select id from region where code_reg = substr('$code', 1, 4)), '$code';"
  echo "id:" $id
  echo $query
  psql -U arcrm -d ArTest -c "$query"
done

for file in *.sql; do
  if [ -f "$file" ]; then
    psql -U arcrm -d ArTest -a -f "$file"
  fi
done
