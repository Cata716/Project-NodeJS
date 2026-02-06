# Product Management System with User Authentication - Node.js Project

A full-stack web application for product management with user authentication, built with Node.js, Express, MySQL, and EJS templating engine.

## Project Description

This project is a complete product management system that allows users to:
- **Register and login** with secure authentication (bcrypt password hashing)
- **View all products** from the database
- **Add new products** with name, price, and description
- **Edit existing products** to update information
- **Delete products** from the system
- **Manage products** through an admin dashboard

The application implements user authentication using **Passport.js** with local strategy, session management with **express-session**, and secure password storage with **bcrypt** hashing.

## Technologies Used

- **Backend Framework:** Node.js with Express.js v5.2.1
- **Database:** MySQL (via mysql2 driver)
- **Templating Engine:** EJS (Embedded JavaScript) v4.0.1
- **Authentication:** Passport.js v0.7.0 with passport-local v1.0.0
- **Password Hashing:** bcrypt v6.0.0
- **Session Management:** express-session v1.19.0
- **Database Driver:** mysql2 v3.16.1 (with promises support)

## Project Structure

```
Proiect_Node.js/
│
├── models/                    # Database models
│   ├── product.js            # Product CRUD operations
│   └── user.js               # User authentication operations
│
├── routes/                    # Application routes
│   └── index.js              # All routes (auth, products, CRUD)
│
├── views/                     # EJS templates (frontend pages)
│   ├── index.ejs             # Homepage/Dashboard
│   ├── login.ejs             # User login page
│   ├── register.ejs          # User registration page
│   ├── manage-products.ejs   # Products management dashboard
│   ├── add-product.ejs       # Add new product form
│   ├── edit-product.ejs      # Edit product form
│   └── delete-product.ejs    # Delete product confirmation
│
├── public/                    # Static files
│   └── styles/               # CSS stylesheets
│       └── style.css         # Main stylesheet
│
├── app.js                     # Main application file (server setup)
├── auth.js                    # Passport.js authentication configuration
├── db.js                      # MySQL database connection pool
├── package.json              # Project dependencies and metadata
├── package-lock.json         # Locked dependency versions
└── database.sql              # Database structure and sample data
```


### Features:

1. **User Registration & Authentication**
   - Secure user registration with password hashing
   - Login system with Passport.js authentication
   - Session-based authentication
   - Logout functionality

2. **Product Management (CRUD Operations)**
   - **Create:** Add new products with name, price, description
   - **Read:** View all products in database
   - **Update:** Edit existing product information
   - **Delete:** Remove products with confirmation

3. **Database Structure**
   - `users` table: id, username, password (hashed)
   - `products` table: id, name, price, description

4. **Security Features**
   - Password hashing with bcrypt (10 salt rounds)
   - Session management for authenticated users
   - Protected routes (require login)
   - SQL injection protection via prepared statements

5. **User Interface**
   - Bootstrap 4.0 styling for responsive design
   - EJS templates for dynamic content
   - User-friendly forms and navigation

## Installation and Setup

### Prerequisites

Make sure you have installed:
- **Node.js** (v14 or higher) - [Download here](https://nodejs.org/)
- **MySQL** server (via XAMPP, WAMP, or standalone installation)
- **npm** (comes bundled with Node.js)

### Step-by-Step Installation

#### Step 1: Clone the Repository
```bash
git clone https://github.com/Cata716/NodeJS-Product-Management.git
cd NodeJS-Product-Management
```

Or download as ZIP and extract to your desired location.

#### Step 2: Install Dependencies
```bash
npm install
```

This command will install all required packages:
```json
{
  "express": "^5.2.1",
  "ejs": "^4.0.1",
  "mysql2": "^3.16.1",
  "bcrypt": "^6.0.0",
  "passport": "^0.7.0",
  "passport-local": "^1.0.0",
  "express-session": "^1.19.0"
}
```

#### Step 3: Setup MySQL Database

**A. Start MySQL Server:**
- If using XAMPP: Start Apache and MySQL from XAMPP Control Panel
- If using WAMP: Start all services from WAMP
- If standalone: Ensure MySQL service is running

**B. Create Database:**

Open phpMyAdmin at `http://localhost/phpmyadmin` or use MySQL command line:

```sql
-- Create database
CREATE DATABASE IF NOT EXISTS gestionare_produse;

-- Select database
USE gestionare_produse;

-- Create users table
CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL
);

-- Create products table
CREATE TABLE IF NOT EXISTS products (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    description TEXT
);
```

**Or simply import the `database.sql` file:**
1. Open phpMyAdmin
2. Create database: `gestionare_produse`
3. Select the database
4. Go to Import tab
5. Choose `database.sql` file
6. Click Go

#### Step 4: Configure Database Connection

Edit `db.js` file with your MySQL credentials:

```javascript
const mysql = require('mysql2/promise');

const pool = mysql.createPool({
    host: 'localhost',
    user: 'root',              // Your MySQL username
    password: '',              // Your MySQL password (empty for XAMPP default)
    database: 'gestionare_produse',
    waitForConnections: true,
    connectionLimit: 10,
    queueLimit: 0,
});

module.exports = pool;
```

#### Step 5: Run the Application

```bash
node app.js
```

You should see:
```
Server is running on http://localhost:3000
```

#### Step 6: Access the Application

Open your web browser and navigate to:
```
http://localhost:3000
```

## Test Accounts

### Pre-existing Users (from database):
- Username: `mara` (password hashed in database)
- Username: `ioana` (password hashed in database)
- Username: `Ionel` (password hashed in database)

**Note:** To use the application, it's recommended to **register a new account** through the registration form, as passwords are encrypted and not directly accessible.

### Sample Products (from database):
- Smartwatch - 499.99 RON
- Camera Foto - 1299.00 RON
- Boxe Bluetooth - 199.50 RON
- Tastatura Mecanica - 349.00 RON
- Monitor 24inch - 899.00 RON
- Telefon Samsung - 1500.00 RON

## Features and Functionality

### 1. User Authentication System

**Registration (`/register`):**
- Users create account with username and password
- Password automatically hashed with bcrypt (10 salt rounds)
- Validation for required fields
- Redirect to login after successful registration

**Login (`/login`):**
- Passport.js local strategy authentication
- Verifies username exists in database
- Compares hashed passwords with bcrypt
- Creates session for authenticated user
- Redirects to homepage on success

**Logout (`/logout`):**
- Destroys user session
- Redirects to homepage

**Session Management:**
- express-session with secret key
- Maintains user state across requests
- Automatic session expiration

### 2. Product Management (CRUD Operations)

**Homepage (`/`):**
- Welcome message with username (if logged in)
- Navigation links based on authentication status
- Access to product management (authenticated users only)

**View Products (`/manage-products`):**
-  **Protected Route** - Requires authentication
- Displays all products from database
- Shows product name, price, and description
- Quick access to Edit and Delete for each product
- Button to add new products

**Add Product (`/add-product`):**
-  **Protected Route** - Requires authentication
- Form with fields: Name, Price, Description
- Server-side validation
- Inserts new product into database
- Redirects to management page after success

**Edit Product (`/edit-product/:id`):**
-  **Protected Route** - Requires authentication
- Pre-fills form with current product data
- Allows updating name, price, description
- Updates database record
- Redirects to management page after success

**Delete Product (`/delete-product/:id`):**
-  **Protected Route** - Requires authentication
- Shows confirmation page with product name
- Confirms deletion before removing from database
- Permanent deletion from products table
- Redirects to management page after success

### 3. Middleware Protection

**isLoggedIn Middleware:**
```javascript
function isLoggedIn(req, res, next) {
    if (req.isAuthenticated()) {
        return next();
    }
    res.redirect('/login');
}
```
- Protects all product management routes
- Redirects unauthenticated users to login
- Ensures data security

##  Security Features

### Password Security
-  **bcrypt hashing** with 10 salt rounds
-  Passwords never stored in plain text
-  Secure password comparison using bcrypt.compare()

### Authentication Security
-  **Passport.js** industry-standard authentication
-  Local strategy with username/password
-  Session serialization/deserialization
-  Protected routes requiring authentication

### Database Security
-  **Prepared statements** prevent SQL injection
-  mysql2 with promise support for secure queries
-  Connection pooling for efficient database access
-  Parameterized queries for all database operations

### Session Security
-  express-session with secret key
-  Session cookies for authentication state
-  Automatic session cleanup on logout

## Database Schema

### Table: `users`
```sql
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL  -- bcrypt hashed
);
```

**Fields:**
- `id` - Auto-incrementing primary key
- `username` - Unique username for login
- `password` - Bcrypt hashed password (60 characters)

### Table: `products`
```sql
CREATE TABLE products (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    description TEXT
);
```

**Fields:**
- `id` - Auto-incrementing primary key
- `name` - Product name (max 255 characters)
- `price` - Product price (decimal with 2 decimal places)
- `description` - Product description (text field)

## API Routes

### Authentication Routes

| Method | Route | Description | Authentication |
|--------|-------|-------------|----------------|
| GET | `/` | Homepage/Dashboard | Public |
| GET | `/register` | Registration form | Public |
| POST | `/register` | Process registration | Public |
| GET | `/login` | Login form | Public |
| POST | `/login` | Process login (Passport) | Public |
| GET | `/logout` | Logout user | Authenticated |

### Product Management Routes

| Method | Route | Description | Authentication |
|--------|-------|-------------|----------------|
| GET | `/manage-products` | View all products | Required |
| GET | `/add-product` | Add product form | Required |
| POST | `/add-product` | Create new product | Required |
| GET | `/edit-product/:id` | Edit product form | Required |
| POST | `/edit-product/:id` | Update product | Required |
| GET | `/delete-product/:id` | Delete confirmation | Required |
| POST | `/delete-product/:id` | Delete product | Required |

## User Interface

### Styling
- **Bootstrap 4.0** for responsive design
- Clean and modern interface
- Mobile-friendly layouts
- Consistent styling across all pages

### Pages Overview

**Homepage (`index.ejs`):**
- Welcome message with personalized greeting
- Navigation based on authentication status
- Links to login/register (guest users)
- Links to manage products/logout (authenticated users)

**Login Page (`login.ejs`):**
- Username and password fields
- Submit button
- Link to registration page
- Error message display (if authentication fails)

**Registration Page (`register.ejs`):**
- Username and password fields
- Submit button
- Error message display (if registration fails)
- Password automatically hashed on submission

**Product Management (`manage-products.ejs`):**
- List of all products with name and price
- Edit button for each product
- Delete button with confirmation prompt
- Add Product button
- Home and Logout links

**Add Product (`add-product.ejs`):**
- Form with Name, Price, Description fields
- Bootstrap styled inputs
- Submit button
- Links to manage products and logout

**Edit Product (`edit-product.ejs`):**
- Pre-filled form with current product data
- Editable Name, Price, Description fields
- Save Changes button

**Delete Product (`delete-product.ejs`):**
- Confirmation message with product name
- Delete button (red, danger style)
- Cancel button to return to management

## Development Mode

For development with automatic server restart on file changes:

**1. Install nodemon globally:**
```bash
npm install -g nodemon
```

**2. Run with nodemon:**
```bash
nodemon app.js
```

**3. Or add to package.json scripts:**
```json
{
  "scripts": {
    "start": "node app.js",
    "dev": "nodemon app.js"
  }
}
```

Then run:
```bash
npm run dev
```

## Dependencies Explanation

### Core Dependencies:

**express (^5.2.1)**
- Web application framework for Node.js
- Handles routing, middleware, HTTP requests

**ejs (^4.0.1)**
- Templating engine for generating HTML
- Allows embedding JavaScript in HTML
- Used for all view files

**mysql2 (^3.16.1)**
- MySQL client for Node.js
- Promise-based API
- Connection pooling support
- Prepared statements for security

### Authentication Dependencies:

**passport (^0.7.0)**
- Authentication middleware for Node.js
- Modular and flexible
- Supports multiple strategies

**passport-local (^1.0.0)**
- Local authentication strategy
- Username and password authentication
- Used with Passport.js

**express-session (^1.19.0)**
- Session middleware for Express
- Manages user sessions
- Required for Passport.js

**bcrypt (^6.0.0)**
- Password hashing library
- Implements bcrypt algorithm
- Generates salted password hashes
- Secure password comparison

## Author

**Lupu Catalina** - https://github.com/Cata716

## License

This project was created for educational purposes as part of a Node.js web development course. 

---
