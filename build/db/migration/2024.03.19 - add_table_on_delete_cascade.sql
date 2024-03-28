do $$
DECLARE
  l_rc  RECORD;
  l_cmd text;
BEGIN
  FOR l_rc IN (SELECT *
                 FROM (SELECT kcu.table_schema AS kcu_table_schema
                             ,kcu.table_name   AS kcu_table_name
                             ,pgc.conname      AS kcu_constraint_name
                             ,CASE
                                WHEN (pgc.contype = 'f') THEN kcu.column_name
                                ELSE ccu.column_name
                              END AS kcu_column_name
                             ,ccu.table_schema AS ccu_table_schema
                             ,CASE
                                WHEN (pgc.contype = 'f') THEN ccu.table_name
                                ELSE (NULL)
                              END AS ccu_reference_table
                             ,CASE
                                WHEN (pgc.contype = 'f') THEN ccu.column_name
                                ELSE (NULL)
                              END AS ccu_reference_col
                             ,rc.delete_rule
                         FROM pg_constraint AS pgc
                         JOIN pg_namespace nsp
                           ON nsp.oid = pgc.connamespace
                         JOIN pg_class cls
                           ON pgc.conrelid = cls.oid
                         JOIN information_schema.key_column_usage kcu
                           ON kcu.constraint_name = pgc.conname
                         JOIN information_schema.constraint_column_usage ccu
                           ON pgc.conname = ccu.constraint_name
                          AND nsp.nspname = ccu.constraint_schema
                         JOIN information_schema.referential_constraints rc
                           ON rc.constraint_name = pgc.conname
                        WHERE pgc.contype = 'f') AS foo
                ORDER BY ccu_reference_table)
  LOOP
    IF l_rc.delete_rule = 'CASCADE' THEN
      CONTINUE;
    END IF;
    l_cmd := 'ALTER TABLE ' || l_rc.kcu_table_schema || '.' || l_rc.kcu_table_name || ' DROP CONSTRAINT ' ||
             l_rc.kcu_constraint_name || ';';
    EXECUTE l_cmd;
    RAISE notice 'Value: %', l_cmd;
    l_cmd := 'ALTER TABLE ' || l_rc.kcu_table_schema || '.' || l_rc.kcu_table_name || ' ADD CONSTRAINT ' ||
             l_rc.kcu_constraint_name || ' FOREIGN KEY (' || l_rc.kcu_column_name || ') REFERENCES ' ||
             l_rc.ccu_table_schema || '.' || l_rc.ccu_reference_table || ' (' || l_rc.ccu_reference_col ||
             ') ON DELETE CASCADE;';
    EXECUTE l_cmd;
    RAISE notice 'Value: %', l_cmd;
  END LOOP;
END;
$$