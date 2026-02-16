import os
# Force the environment variables to specific values
os.environ['DATABASE_URL'] = 'sqlite+aiosqlite:///./todo_app.db'
os.environ['COHERE_API_KEY'] = 'E0BCt3Np4v0KWCyLpb6QmW4z71ValSKroJY7hi7'
os.environ['BETTER_AUTH_SECRET'] = 'dev-secret-for-local-testing'
os.environ['BETTER_AUTH_URL'] = 'http://localhost:3000'

from app.main import app
import uvicorn

if __name__ == "__main__":
    print("Starting server with forced environment variables...")
    print(f"COHERE_API_KEY is set: {'Yes' if os.environ.get('COHERE_API_KEY') else 'No'}")
    # Changed host to 0.0.0.0 to accept connections from any interface
    uvicorn.run(app, host="0.0.0.0", port=8000, log_level="info")