# Todos REST API

This project is a simple Todos REST API developed in Ruby on Rails as a university assignment. It provides endpoints to manage todos and todo items. The API includes JWT authentication for securing and authorizing requests, and Swagger documentation for easy API exploration.

## Endpoints

### Authentication
- **POST /auth/login:** Login
- **POST /signup:** Signup a new user

### Todos
- **GET /todos:** List all todos and todo items
- **POST /todos:** Create a new todo
- **GET /todos/:id:** Get a todo
- **PUT /todos/:id:** Update a todo
- **DELETE /todos/:id:** Delete a todo and its items

### Todo Items
- **GET /todos/:todo_id/items:** List all todo items
- **POST /todos/:todo_id/items:** Create a new todo item
- **GET /todos/:todo_id/items/:id:** Get a todo item
- **PUT /todos/:todo_id/items/:id:** Update a todo item
- **DELETE /todos/:todo_id/items/:id:** Delete a todo item

## Screenshots

<img width="750" alt="todos-api-swagger" src="https://github.com/anthonyrouss/todos-api-rails/assets/79643636/06ac5f3b-0d6d-4f99-9169-e310a15b880c">
