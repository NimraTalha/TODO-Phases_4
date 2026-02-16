from app.core.config import settings
print("PROJECT_NAME:", settings.PROJECT_NAME)
print("DATABASE_URL:", settings.DATABASE_URL)
print("COHERE_API_KEY:", settings.COHERE_API_KEY)
print("BETTER_AUTH_SECRET:", settings.BETTER_AUTH_SECRET)
print("BETTER_AUTH_URL:", settings.BETTER_AUTH_URL)

if settings.COHERE_API_KEY:
    print("\n✓ Cohere API key is properly configured!")
else:
    print("\n✗ Cohere API key is missing!")