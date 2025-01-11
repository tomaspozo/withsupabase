<p align="center">
  <img src="https://ugoelywoxxcasrqhlxei.supabase.co/storage/v1/object/public/covers/1.jpg" alt="Secure API calls from db functions with Supabase pg_net and vault">
  <h1>Secure API calls from db functions with Supabase pg_net and vault</h1>
</p>

This sample project provides showcases how to use Supabase DB functions to call external services like APIs and webhooks in a secure and clean way using [pg_net](https://github.com/supabase/pg_net) and [vault](https://github.com/supabase/vault).

## Requirements

- Supabase CLI installed
- A webhook URL. We'll use [webhook-test.com](https://webhook-test.com/) for testing.

## Usage

1. Clone the repository:

   ```bash
   git clone https://github.com/tomaspozo/withsupabase.git
   cd withsupabase/db-functions-api-calls
   ```

2. Start your local Supabase instance:

   ```bash
   supabase start
   ```

3. The initial migrations will be applied and the database will be ready to use with:

   - A `messages` table.
   - Dummy `send_message_to_webhook` db funtion. The initial version of this function won't call your webhook, it will only log the message.
   - A trigger that calls the `send_message_to_webhook` function on new messages records.

## Next steps

Follow along with the video tutorial [COMING SOON](#)

Or, set up manually:

1. Create the foolowing vault secrets in your Supabase instance:

   - `WEBHOOK_URL_SECRET`: the URL of your webhook.
   - `WEBHOOK_TOKEN_SECRET`: the token of your webhook.

2. Copy and execute the following SQL scripts on you local Supabase instance SQL editor:

   - `resources/db_function_get_decrypted_secret.sql`: create a reusable function to get decrypted secrets from vault.
   - `resources/db_function_send_message_to_webhook_secure.sql`: update the `send_message_to_webhook` db function to make a secure call to your webhook.

3. Create a new message record in the `messages` table.

4. Verify that the message was sent to your webhook.

## Troubleshooting

- **Webhook not being called** - check the pg_net responses table by running the following SQL:
  ```sql
  select * from net._http_response;
  ```
