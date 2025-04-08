# Simplest Flask OAuth2 App

A minimal Flask application protected by OAuth2 using GitHub as the authentication provider.

## Setup

1. Create a GitHub OAuth App at https://github.com/settings/developers
   - Set homepage URL to `http://localhost:4180`
   - Set authorization callback URL to `http://localhost:4180/oauth2/callback`

2. Copy the `.env.example` file to `.env` and fill in your GitHub credentials:
   ```
   cp .env.example .env
   ```

3. Generate a random cookie secret and add it to your `.env` file:
   ```
   openssl rand -hex 16
   ```
   This will generate a 32-character hex string (16 bytes). The cookie secret must be exactly 16, 24, or 32 bytes.

## Running with Docker

```
docker-compose up --build
```

Visit `http://localhost:4180` to access your application. You'll be redirected to GitHub for authentication.

## How it works

- The Flask app runs on port 5000 inside the Docker network
- OAuth2-Proxy runs on port 4180 and is publicly accessible
- All requests go through OAuth2-Proxy which handles authentication with GitHub
- After successful authentication, OAuth2-Proxy forwards requests to the Flask app with user information in headers