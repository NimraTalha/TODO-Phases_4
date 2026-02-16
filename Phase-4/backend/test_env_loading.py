import os
from dotenv import load_dotenv

# Load the .env file explicitly
load_dotenv('.env')

print("Environment variables loaded from .env file:")
print("DATABASE_URL from .env file:", os.getenv('DATABASE_URL'))
print("COHERE_API_KEY from .env file:", os.getenv('COHERE_API_KEY'))
print("BETTER_AUTH_SECRET from .env file:", os.getenv('BETTER_AUTH_SECRET'))

print("\nTrying to import from config:")
from app.core.config import settings
print("DATABASE_URL from settings:", settings.DATABASE_URL)
print("COHERE_API_KEY from settings:", settings.COHERE_API_KEY)
print("BETTER_AUTH_SECRET from settings:", settings.BETTER_AUTH_SECRET)