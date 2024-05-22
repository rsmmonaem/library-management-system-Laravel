# Library Management System (Laravel Backend)
# With Auto Deploy TO Server 
This repository contains the backend API for a Library Management System built using Laravel.

Video Link: I will upload soon)

## Backend API

The backend API serves as the foundation for the Library Management System. It provides endpoints for managing members, books, authors, borrowed books, and user authentication.

Backend API Link: [http://lms.upseba.com.bd/](http://lms.upseba.com.bd/)

## Frontend

The frontend for this project is built using Vue.js.

**Live Demo**: [Library Management System - Vue.js](https://library-management-system-vue-js.vercel.app/)

**Frontend Repository**: [Library Management System - Vue.js Repository](https://github.com/rsmmonaem/library-management-system-vue_js)

## API Routes

### Authentication

- **Login**: `POST /login`
- **Logout**: `POST /logout` (requires authentication)

### Members

- **List Members**: `GET /members`
- **Create Member**: `POST /members`
- **Show Member**: `GET /members/{member}`
- **Update Member**: `PUT/PATCH /members/{member}`
- **Delete Member**: `DELETE /members/{member}`
- **Show Specific Member by ID**: `GET /member/{MemberID}`

### Books

- **List Books**: `GET /books`
- **Create Book**: `POST /add_book`
- **Show Book**: `GET /book/{BookID}`
- **Show Books by Author**: `GET /books/author/{slug}`
- **Update Book**: `PATCH /update_book/{BookID}`
- **Delete Book**: `DELETE /delete_book/{BookID}`

### Authors

- **List Authors**: `GET /authors`
- **Create Author**: `POST /add_author`
- **Show Author**: `GET /author/{AuthorID}`
- **Update Author**: `PATCH /update_author/{AuthorID}`
- **Delete Author**: `DELETE /delete_author/{AuthorID}`

### Borrowed Books

- **List Borrowed Books**: `GET /borrowed-books-list`
- **Show Borrowed Books by Member ID**: `GET /borrowed-books/{MemberID}`
- **Show Specific Borrowed Book by ID**: `GET /borrowed-book/{BorrowID}`
- **Borrow a Book**: `POST /borrow-book`
- **Return a Borrowed Book**: `PUT /borrowed-books/{borrowID}/return/{memberID}`
- **Update Borrowed Book**: `PATCH /update-borrow-book/{BorrowID}`
- **Delete Borrowed Book**: `DELETE /delete-borrow-book/{BorrowID}`

### User

- **Get User Info**: `GET /user` (requires authentication)

