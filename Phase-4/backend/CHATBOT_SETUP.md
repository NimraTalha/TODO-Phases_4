# Chatbot Setup Instructions

To enable the AI chatbot functionality in the Todo app, you need to configure a valid Cohere API key.

## Getting a Cohere API Key

1. Visit [https://dashboard.cohere.com/api-keys](https://dashboard.cohere.com/api-keys)
2. Sign up or log in to your Cohere account
3. Generate a new API key
4. Copy the API key

## Configuring the API Key

Add your API key to the `.env` file in both locations:

### Backend Root Directory
```
C:\Users\jc\Desktop\todo\todopro\Phase-4\backend\.env
```

### Core Configuration Directory
```
C:\Users\jc\Desktop\todo\todopro\Phase-4\backend\app\core\.env
```

Set the value as follows:
```
COHERE_API_KEY=your_actual_api_key_here
```

## Testing the Chatbot

After setting the API key, you can test the chatbot functionality:

1. Run the server:
   ```
   cd C:\Users\jc\Desktop\todo\todopro\Phase-4\backend
   python run_server_forced.py
   ```

2. The chatbot endpoint will be available at:
   ```
   POST /api/{user_id}/chat
   ```

## Chatbot Features

The AI chatbot supports:
- Adding tasks: "Add a task to buy groceries"
- Listing tasks: "Show my tasks" or "list dikhao"
- Completing tasks: "Mark task #1 as complete" or "complete kardo"
- Deleting tasks: "Delete task #1" or "delete kardo"
- Multilingual support: English, Roman Urdu, and Urdu

## Troubleshooting

If you get an "invalid api token" error, double-check that:
1. Your API key is correctly entered in the .env files
2. Your API key has not expired
3. You have sufficient credits in your Cohere account