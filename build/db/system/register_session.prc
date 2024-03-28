drop procedure if exists register_session;

CREATE OR REPLACE PROCEDURE register_session(p_user_id in bigint) AS
$$
BEGIN
  call set_context('USER_ID', p_user_id::varchar);

END;
$$ LANGUAGE plpgsql;
