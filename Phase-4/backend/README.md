# Todo App - Backend Deployment

Welcome to the Todo App backend! This is a FastAPI-based backend that powers the Todo application with features like task management, authentication, and AI-powered chat capabilities.

## 🚀 Quick Start

### Prerequisites
- Python 3.12+
- Docker & Docker Compose (for containerized deployment)
- PostgreSQL database (local or hosted)

### Local Development
1. Navigate to the backend directory: `cd Phase-4/backend`
2. Install dependencies: `pip install -r requirements.txt`
3. Set up environment variables in `.env` file
4. Run the server: `uvicorn app.main:app --reload`

### Docker Deployment
1. Build and run with Docker Compose: `docker-compose up -d`
2. The backend will be available at `http://localhost:8000`

## ☁️ Cloud Deployment Options

### Railway (Recommended)
[![Deploy on Railway](https://railway.app/button.svg)](https://railway.app/new/template?template=https://github.com/NimraTalha/TODO-Phases_4)

### Heroku
[![Deploy](https://www.herokucdn.com/deploy/button.svg)](https://heroku.com/deploy)

### Render
[![Deploy to Render](https://render.com/images/deploy-to-render-button.svg)](https://render.com/deploy)

## 🔧 Environment Variables

Required environment variables for deployment:

| Variable | Description | Example |
|----------|-------------|---------|
| `DATABASE_URL` | PostgreSQL connection string | `postgresql://user:pass@host:port/db` |
| `BETTER_AUTH_SECRET` | Authentication secret key | Random 32+ character string |
| `BETTER_AUTH_URL` | Frontend application URL | `https://your-frontend.com` |
| `COHERE_API_KEY` | Cohere API key (optional) | `your-cohere-api-key` |

## 📡 API Endpoints

- `GET /health` - Health check
- `GET /test-db` - Database connectivity test
- `GET /api/ping` - API test
- `POST /api/auth/register` - User registration
- `POST /api/auth/login` - User login
- `GET /api/tasks` - Get user tasks
- `POST /api/tasks` - Create new task
- `POST /api/chat` - AI chat functionality

## 🛠️ Technologies Used

- **FastAPI** - Modern, fast web framework for building APIs with Python
- **SQLModel** - SQL databases with Python, combining SQLAlchemy and Pydantic
- **PostgreSQL** - Powerful, open-source object-relational database
- **AsyncPG** - Fast PostgreSQL driver for Python/asyncio
- **Cohere** - AI-powered chat and language processing
- **Uvicorn** - Lightning-fast ASGI server

## 🚢 Production Deployment

For production deployments, ensure you:

1. Use a production-grade PostgreSQL database
2. Set strong, unique values for all environment variables
3. Configure SSL certificates for secure connections
4. Set up monitoring and logging
5. Implement backup strategies for your database

## 🤝 Contributing

Feel free to contribute to this project by submitting issues or pull requests. For major changes, please open an issue first to discuss what you would like to change.

## 📜 License

This project is licensed under the MIT License - see the LICENSE file for details.

## 🆘 Support

If you encounter any issues during deployment, please check:

1. The `BACKEND_DEPLOYMENT.md` file for detailed instructions
2. The backend logs for error messages
3. Ensure all environment variables are correctly set
4. Check that your database is accessible

For additional help, create an issue in the repository.