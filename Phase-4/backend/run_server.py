import os
# Force the DATABASE_URL to use SQLite
os.environ['DATABASE_URL'] = 'sqlite+aiosqlite:///./todo_app.db'

from app.main import app
import uvicorn

if __name__ == "__main__":
    print("Starting server with SQLite database...")
    uvicorn.run(app, host="127.0.0.1", port=8000, log_level="info")