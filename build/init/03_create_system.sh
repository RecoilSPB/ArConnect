#!/bin/sh
cd /db/system/ || { echo "Failed to change directory. Exiting script."; exit 1; }

for file in *.fnc *.prc; do
  #  создание системных функций и процедур
  if [ -f "$file" ]; then
    psql -U arcrm -d ArTest -a -f "$file"
  fi
done

#  создание тригиров по шаблону system_trigger.template
while read line; do
  if [ "$(echo "$line" | grep -E "^start ")" ]; then
    filename=$(echo "$line" | sed 's/^start //' | tr -d ';')
    table_name=$(basename "$filename" | cut -d'.' -f1) # Добываем имя таблицы из имени файла
    trigger_name="trg_${table_name}"
    template_file="system_trigger.template"
    new_trigger_file="${trigger_name}.sql"

    echo "Create trigger: $trigger_name"

    # Создание нового файла с измененными значениями шаблона
    sed "s/\${triggerName}/$trigger_name/g; s/\${tableName}/$table_name/g" "$template_file" >"$new_trigger_file"

    # Выполнение файла с новым триггером в базе данных
    psql -U arcrm -d ArTest -a -f "$new_trigger_file"
  fi
done </db/tables/install_table.sql
