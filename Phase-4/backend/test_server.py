import asyncio
from app.main import app
import uvicorn

if __name__ == "__main__":
    print("Starting server...")
    try:
        uvicorn.run(app, host="127.0.0.1", port=8000, log_level="debug")
    except Exception as e:
        print(f"Error starting server: {e}")
        import traceback
        traceback.print_exc()