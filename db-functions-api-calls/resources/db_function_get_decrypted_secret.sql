CREATE OR REPLACE FUNCTION public.get_decrypted_secret(secret_name TEXT)
RETURNS TEXT AS $$
DECLARE
    secret TEXT := '';
BEGIN
    SELECT decrypted_secret
    INTO secret
    FROM vault.decrypted_secrets
    WHERE name = secret_name
    LIMIT 1;

    RETURN secret;
END;
$$ LANGUAGE plpgsql SECURITY INVOKER;
