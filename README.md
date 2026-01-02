# FSAD 2025 Midterm Lab - Recipe Sharing App

**By:** Aye Khin Khin Hpone (Yolanda Lim)  
**Student ID:** st125970  

https://gitlab.com/ait-fsad-2025/yolanda_sake/st125970_midterm#

http://192.41.170.117:5970/

https://hub.docker.com/repository/docker/yolandalim/st125970_recipeapp/general


This is the Rails application for the FSAD 2025 Midterm Lab Part II.  
It provides a basic **recipe sharing platform** with **Recipes** and **Ratings** functionality.  

---

## 📌 Project Overview  
A Ruby on Rails web application with authentication, recipes, and ratings.  
Developed as part of the **FSAD Midterm Lab Exam (Oct 2025)** to demonstrate:  
- Rails fundamentals with Devise authentication  
- Recipe management with user associations  
- Rating system with validations  
- PostgreSQL integration  
- Dockerized deployment  

---

## 🚀 Features  
- Rails served via **Docker + Docker Compose**  
- **Devise** user authentication (sign up, login, logout with first/last name)  
- **Recipes CRUD** (name, cooking time, description with user ownership)  
- **Ratings** system (1-5 score + comments, one rating per user per recipe)  
- **Index page**: shows all recipes with average ratings  
- **Show page**: displays recipe details, all ratings, and rating form  
- **Authentication control**: anyone can browse, only logged-in users can modify  

---

## 🛠️ How To Run
### Prerequisites:
1. Docker
2. Docker Compose

### Run by building the source code
**Clone the Repository**
```bash
git clone https://gitlab.com/ait-fsad-2025/yolanda_sake/st125970_midterm#
```

1. **Build and Setup Database**
```bash
docker compose build
docker compose run --rm web rails db:create db:migrate
```

2. **Start the Application**
```bash
docker compose up
```

3. **Access the Application**
```bash
# Local development
http://localhost:3000

# Production server
http://192.41.170.117:5970
```

---

## 🌐 Deployment (CSIM)  
- Image built & pushed to Docker Hub  
- Deployed on CSIM server at:  
  👉 [http://192.41.170.117:5970](http://192.41.170.117:5970)  
- Database created and migrated using Rails commands inside container  

---

## 📋 Application Structure

### Models
- **User**: Devise authentication with first_name, last_name
- **Recipe**: belongs_to user, has_many ratings (name, cooking_time, description)
- **Rating**: belongs_to user and recipe (score 1-5, content, uniqueness per user-recipe)

### Key Routes
- `/` - Recipes index (public access)
- `/recipes/:id` - Recipe show page (public access)
- `/users/sign_up` - User registration
- `/users/sign_in` - User login
- `/ratings` - User's own ratings (authenticated only)

### Authentication Rules
- **Public access**: Browse recipes, view recipe details and ratings
- **Authenticated users only**: Add/edit/delete recipes, leave ratings
- **Owner only**: Edit/delete own recipes and ratings

---

## 🧪 Database Schema
```sql
Users: id, email, first_name, last_name, encrypted_password
Recipes: id, name, cooking_time, description, user_id
Ratings: id, score, content, recipe_id, user_id
```

---

## ✅ Key Features Implemented
- ✅ User authentication with Devise (sign up, sign in, sign out)
- ✅ Recipe management (CRUD operations)
- ✅ Rating system with score validation (1-5)
- ✅ Average rating calculation and display
- ✅ User ownership and authorization controls
- ✅ Form validations and error handling

---

**Developed by:**  
*Aye Khin Khin Hpone (Yolanda Lim) – st125970*  
*FSAD 2025 Midterm Lab Exam*