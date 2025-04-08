from flask import Flask, request, jsonify
import os
from dotenv import load_dotenv

load_dotenv()

app = Flask(__name__)

@app.route('/')
def index():
    # Access user info from X-Forwarded-User header set by oauth2-proxy
    user = request.headers.get('X-Forwarded-User', 'Unknown User')
    
    return jsonify({
        'message': f'Hello, {user}! This is a protected page.',
        'status': 'authenticated'
    })

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=int(os.environ.get('PORT', 5000)), debug=True)
