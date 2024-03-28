DO
$do$
BEGIN
   IF NOT EXISTS (
      SELECT *
        FROM pg_catalog.pg_user u
       WHERE u.usename = '${userName}'
   ) THEN
      CREATE USER ${userName} WITH ENCRYPTED PASSWORD '${pass}';
   END IF;

    create schema if not exists ${userName} authorization ${userName};

    ALTER ROLE ${userName} SET search_path = "$user";

    grant all on schema ${userName} to ${userName};

END
$do$;
