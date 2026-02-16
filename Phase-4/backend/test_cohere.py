import os
# Force the environment variables to specific values
os.environ['DATABASE_URL'] = 'sqlite+aiosqlite:///./todo_app.db'
os.environ['COHERE_API_KEY'] = 'E0BCt3Np4v0KWCyLpb6QmW4z71ValSKroJpY7hi7'
os.environ['BETTER_AUTH_SECRET'] = 'dev-secret-for-local-testing'
os.environ['BETTER_AUTH_URL'] = 'http://localhost:3000'

print("Setting environment variables...")
print(f"DATABASE_URL: {os.environ.get('DATABASE_URL')}")
print(f"COHERE_API_KEY: {os.environ.get('COHERE_API_KEY')}")
print(f"BETTER_AUTH_SECRET: {os.environ.get('BETTER_AUTH_SECRET')}")
print(f"BETTER_AUTH_URL: {os.environ.get('BETTER_AUTH_URL')}")

# Now import and initialize the chatbot to test if it can access the API key
from app.core.config import settings
print("\nSettings after import:")
print(f"settings.COHERE_API_KEY: {settings.COHERE_API_KEY}")

from app.services.chatbot import ChatbotService
service = ChatbotService()
print(f"\nChatbot service initialized. Cohere client available: {service.co is not None}")

if service.co is None:
    print("ERROR: Cohere client is None - API key is not accessible to the service")
else:
    print("SUCCESS: Cohere client is initialized")

# Test the actual chatbot functionality
import asyncio

async def test_chatbot():
    try:
        # Create a mock db session for testing
        from sqlmodel.ext.asyncio.session import AsyncSession
        print("\nTesting chatbot initialization...")
        
        # Just test if the service can be created with the API key
        print(f"Cohere API key in service: {'Found' if service.co is not None else 'Missing'}")
        
    except Exception as e:
        print(f"Error in test: {e}")
        import traceback
        traceback.print_exc()

# Run the test
asyncio.run(test_chatbot())