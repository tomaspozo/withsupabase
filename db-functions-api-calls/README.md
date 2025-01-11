<p align="center">
  <img src="https://ugoelywoxxcasrqhlxei.supabase.co/storage/v1/object/public/covers/SECURE%20API%20Calls%20from%20DB%20Functions.png" alt="Secure API calls from db functions with Supabase pg_net and vault">
  <h1>Secure API calls from db functions with Supabase pg_net and vault</h1>
</p>

This project provides examples of how to use Supabase DB functions to call external services like APIs and webhooks in a secure and clean way using [pg_net](https://github.com/supabase/pg_net) and [vault](https://github.com/supabase/vault).

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
