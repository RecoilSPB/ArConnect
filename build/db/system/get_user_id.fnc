CREATE OR REPLACE FUNCTION get_user_id()
 RETURNS bigint AS
$$
DECLARE

  l_user_id      bigint;
  l_prog        varchar(128);
BEGIN
  l_user_id := get_context('USER_ID')::bigint;

  IF l_user_id IS NOT NULL THEN
    RETURN l_user_id;
  END IF;

  SELECT v.application_name
    INTO STRICT l_prog
    FROM pg_stat_activity v
   WHERE v.pid = pg_backend_pid()
     AND upper(v.state) = 'ACTIVE';

  IF upper(l_prog) = 'PLSQLDEV.EXE'
     OR upper(l_prog) = 'TOAD.EXE'
     OR upper(l_prog) LIKE 'DBEAVER%' THEN
    call set_context('USER_ID', '-1');
    RETURN -1;
  END IF;

  RETURN 0;

END;
$$ language plpgsql;
