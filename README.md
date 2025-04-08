# Simplest Flask OAuth2 App

A minimal Flask application protected by OAuth2 using GitHub as the authentication provider.

## Local Setup

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

## Running Locally with Docker

```
docker-compose up --build
```

Visit `http://localhost:4180` to access your application. You'll be redirected to GitHub for authentication.

## Deploying to Render

1. Create a new GitHub OAuth App for your Render deployment:
   - Set homepage URL to your future Render domain, e.g., `https://oauth2-proxy.onrender.com`
   - Set authorization callback URL to `https://oauth2-proxy.onrender.com/oauth2/callback`

2. Create a Render account and connect your GitHub repository

3. Use the "Blueprint" deployment option and select your repository
   - Render will automatically detect the `render.yaml` file and set up your services

4. After deployment, update your GitHub OAuth App's URLs to match your actual Render domains

5. Set your GitHub Client ID and Secret in the Render dashboard under the flask-app service environment variables

## How it works

- The Flask app runs privately, not directly accessible from the internet
- OAuth2-Proxy is publicly accessible and handles authentication with GitHub
- All requests go through OAuth2-Proxy which authenticates users with GitHub
- After successful authentication, OAuth2-Proxy forwards requests to the Flask app with user information in headers