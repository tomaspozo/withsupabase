CREATE OR REPLACE FUNCTION public.send_message_to_webhook()
RETURNS TRIGGER AS $$
BEGIN
    RAISE LOG 'New message: %', NEW;

    PERFORM net.http_post(
        url := 'https://webhook-test.com/1a62629b4d70c3aaad75f09194e42c94',
        headers := jsonb_build_object(
            'Authorization', 'Bearer ultra_secret_token',
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