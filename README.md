📚 Book Service

CRUD operations on books.
Pagination, searching, and filtering.
Book entity linked with Category & Publisher.
DTO ↔ Entity mapping.
Interceptors to track user preferences.

👤 User Service

User registration & login with OTP verification.
JWT-based Authentication & Authorization.
Role-based access:
  Admin → Manage all books & users.
  User → View books & manage own orders.

🛒 Order Service

Add, update, and cancel orders.
Restricts users to their own orders only.

📧 Email Service

OTP email verification.
Notifications for book back in stock.
Scheduled jobs to send periodic emails.

🛠️ Tech Stack

Backend: Spring Boot, Spring Data JPA, Spring Security (JWT), Redis, MySQL
Frontend: React.js
DevOps: Docker & Docker Compose

📝 Other Features

Caching with Redis
Global Exception Handling
Logging
Entity Validation

🔮 Future Enhancements

Swagger API Documentation
Payment Gateway Integration
