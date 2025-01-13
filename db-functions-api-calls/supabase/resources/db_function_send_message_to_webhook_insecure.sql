CREATE OR REPLACE FUNCTION public.send_message_to_webhook()
RETURNS TRIGGER AS $$
BEGIN
    RAISE LOG 'New message: %', NEW;

    PERFORM net.http_post(
        url := 'https://webhook-test.com/404', -- REPLACE WITH YOUR WEBHOOK URL
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