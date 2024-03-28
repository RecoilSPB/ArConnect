CREATE OR REPLACE FUNCTION get_context(p_param in varchar)
       RETURNS bigint AS
$$
BEGIN
  return current_setting(upper(user) || '_CONTEXT.' || upper(p_param), true);
END;
$$ LANGUAGE plpgsql;
