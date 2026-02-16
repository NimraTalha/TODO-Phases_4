import os
# Set the environment variables like in run_server_forced.py
os.environ['DATABASE_URL'] = 'sqlite+aiosqlite:///./todo_app.db'
os.environ['COHERE_API_KEY'] = 'E0BCt3Np4v0KWCyLpb6QmW4z71ValSKroJY7hi7'
os.environ['BETTER_AUTH_SECRET'] = 'dev-secret-for-local-testing'
os.environ['BETTER_AUTH_URL'] = 'http://localhost:3000'

print('Testing Chatbot with model: command-r-plus')
print('API Key start:', os.environ.get('COHERE_API_KEY', '')[:5] + '...')

from app.services.chatbot import ChatbotService
service = ChatbotService()
if not service.co:
    print('FAILED: Cohere client not initialized.')
else:
    print('SUCCESS! Chatbot service initialized.')
    
    # Test a simple message
    try:
        response = service.co.chat(
            message='Hi, are you working?',
            model='command-r-plus'
        )
        print('\nSUCCESS! Chatbot response:')
        print(response.text)
    except Exception as e:
        print(f'\nFAILED: {str(e)}')
        import traceback
        traceback.print_exc()