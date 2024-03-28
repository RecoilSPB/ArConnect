#!/bin/sh
cd /db/tables/ || { echo "Failed to change directory. Exiting script."; exit 1; }
pwd
while read line; do
    if [ "$(echo "$line" | grep -E "^start ")" ]; then
        filename=$(echo "$line" | sed 's/^start //' | tr -d ';')
        table_name=$(basename "$filename" | cut -d'.' -f1) # Добываем имя таблицы из имени файла
        echo "Processing file: $filename"
        psql -U arcrm -d ArTest -a -f ${filename}

        # Формируем имя последовательности
        sequence_name="s_${table_name}"
        echo "Create sequence: ${sequence_name}"
        # Выполняем создание последовательности для каждой таблицы
        psql -U arcrm -d ArTest -c "CREATE SEQUENCE ${sequence_name};"

    fi
done < install_table.sql

