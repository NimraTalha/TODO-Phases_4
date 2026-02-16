import os
from dotenv import load_dotenv

print('Before loading:')
print('COHERE_API_KEY:', repr(os.environ.get('COHERE_API_KEY')))

# Load the .env file
load_dotenv('./.env')

print('After loading:')
print('COHERE_API_KEY:', repr(os.environ.get('COHERE_API_KEY')))
print('DATABASE_URL:', repr(os.environ.get('DATABASE_URL')))
print('All env vars containing COHERE:', [k for k in os.environ.keys() if 'COHERE' in k])

# Also test importing the settings directly
from app.core.config import settings
print('Settings COHERE_API_KEY:', repr(settings.COHERE_API_KEY))