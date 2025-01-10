CREATE OR REPLACE FUNCTION public.send_message_to_webhook()
RETURNS TRIGGER AS $$
BEGIN
    RAISE LOG 'New message: %', NEW;

    PERFORM net.http_post(
        url := get_decrypted_secret('WEBHOOK_URL_SECRET'),
        headers := jsonb_build_object(
            'Authorization', 'Bearer ' || get_decrypted_secret('WEBHOOK_TOKEN_SECRET'),
            'Content-Type', 'application/json'
        ),
        body := jsonb_build_object(
          'id', NEW.id,
          'message', NEW.message
        ),
        timeout_milliseconds := 5000
    );

    RETURN NEW;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;