CREATE OR REPLACE PROCEDURE set_context(p_param in varchar, p_value in varchar) AS
$$
BEGIN
  perform set_config(upper(user) || '_CONTEXT.' || upper(p_param), p_value, false);
END;
$$ LANGUAGE plpgsql;
