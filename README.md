# Personal Book Tracker API (Ruby on Rails)

This project is a **Personal Book Tracker API** implemented in Ruby on Rails. The API allows users to manage their personal library, including adding books, tracking their reading status, and retrieving popular books.

## Features
- **User Management**: Create users with secure authentication.
- **Book Management**: Add, update, delete, and list books.
- **User Library**: Associate books with users and track their reading status.
- **Popular Books**: Retrieve the most highly rated books.
- **Pagination**: Paginate through the list of books.
- **Caching**: Cache popular books and user libraries using Redis.

---

## Installation

### Prerequisites
- Ruby 3.3.6
- Rails 8.0
- PostgreSQL
- Redis

### Setup
1. Clone the repository:
   ```bash
   git clone https://github.com/welch5788/book_tracker_api.git
   cd book_tracker_api
   ```

2. Install dependencies:
   ```bash
   bundle install
   ```

3. Set up the database:
   ```bash
   rails db:create db:migrate db:seed
   ```

4. Start the Redis server:
   ```bash
   redis-server
   ```

5. Start the Rails server:
   ```bash
   rails server
   ```

---

## Endpoints

### **Books**

#### **List Books**
- **GET** `/books`
- **Description**: Retrieve a paginated list of books.
- **Query Parameters**:
    - `page`: Page number for pagination (default: 1).
- **Response**:
  ```json
  {
    "books": [
      {
        "id": 1,
        "title": "The Hobbit",
        "author": "J.R.R. Tolkien",
        "genre": "Fantasy",
        "average_rating": 4.8
      }
    ],
    "meta": {
      "current_page": 1,
      "total_pages": 1,
      "total_books": 10
    }
  }
  ```

#### **Create a Book**
- **POST** `/books`
- **Request Body**:
  ```json
  {
    "book": {
      "title": "The Hobbit",
      "author": "J.R.R. Tolkien",
      "genre": "Fantasy",
      "average_rating": 4.8
    }
  }
  ```
- **Response**:
  ```json
  {
    "id": 1,
    "title": "The Hobbit",
    "author": "J.R.R. Tolkien",
    "genre": "Fantasy",
    "average_rating": 4.8
  }
  ```

#### **Update a Book**
- **PATCH/PUT** `/books/:id`
- **Request Body**:
  ```json
  {
    "book": {
      "average_rating": 4.9
    }
  }
  ```
- **Response**:
  ```json
  {
    "id": 1,
    "title": "The Hobbit",
    "author": "J.R.R. Tolkien",
    "genre": "Fantasy",
    "average_rating": 4.9
  }
  ```

#### **Delete a Book**
- **DELETE** `/books/:id`
- **Response**:
  ```json
  {
    "message": "Book successfully deleted"
  }
  ```

#### **Popular Books**
- **GET** `/books/popular`
- **Description**: Retrieve the 10 most highly rated books (cached for 12 hours).
- **Response**:
  ```json
  [
    {
      "id": 1,
      "title": "The Hobbit",
      "author": "J.R.R. Tolkien",
      "genre": "Fantasy",
      "average_rating": 4.8
    }
  ]
  ```

---

## Testing
1. Open the Rails console:
   ```bash
   rails console
   ```
2. Create sample data:
   ```ruby
   user = User.create(email: "test@example.com", password: "password123")
   book = Book.create(title: "The Hobbit", author: "J.R.R. Tolkien", genre: "Fantasy", average_rating: 4.8)
   UserBook.create(user: user, book: book, status: "reading")
   ```
3. Test API endpoints using Postman or curl.

---

## Technologies Used
- **Backend**: Ruby on Rails
- **Database**: PostgreSQL
- **Caching**: Redis
- **Authentication**: has_secure_password

---

## Future Improvements
- Implement AI-based book recommendations.
- Add user authentication and authorization.
- Expand caching to additional endpoints.

---

## License
This project is licensed under the MIT License. See the `LICENSE` file for details.

---

## Contact
For questions or suggestions, contact Morgan at welch5788@gmail.com.
