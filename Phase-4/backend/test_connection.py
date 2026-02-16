import requests
import json

# Test if the backend is accessible from the frontend's perspective
try:
    # Test health endpoint
    response = requests.get("http://localhost:8000/health")
    print(f"Health check: {response.status_code} - {response.json()}")
    
    # Test if we can make a POST request similar to what the frontend would make
    # This will fail due to authentication, but should at least reach the server
    headers = {
        "Content-Type": "application/json",
        "Authorization": "Bearer dummy-token"
    }
    data = {
        "message": "test message"
    }
    
    # Use a dummy user ID to test the endpoint
    response = requests.post("http://localhost:8000/api/test-user-id/chat", 
                           headers=headers, 
                           data=json.dumps(data))
    
    print(f"Chat endpoint test: {response.status_code} - {response.json() if response.content else 'No content'}")
    
except requests.exceptions.ConnectionError as e:
    print(f"Connection error: {e}")
except Exception as e:
    print(f"Other error: {e}")