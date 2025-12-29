# 🚕 Ride Hailing App
### Java | JSP | Servlets | Hibernate | MySQL

A **full-stack Java web application** that simulates a real-world  
**ride-hailing platform** with **Customer** and **Driver** roles.

Built using **core Java Web technologies (no Spring)**,  
following a clean **MVC architecture**.

---

## 🌟 Highlights

- Role-based login (**Customer / Driver**)
- Real-time ride status updates
- Complete ride lifecycle
- Hibernate ORM (JPA)
- JSP-based UI with clean CSS
- Session-based authentication
- Industry-style backend flow

---

## 🧭 Application Flow

### 👤 Customer Flow
<img width="614" height="576" alt="image" src="https://github.com/user-attachments/assets/f1f81b97-3d98-4301-9a6c-0323aa9790a3" />

### 🚗 Driver Flow
<img width="416" height="396" alt="image" src="https://github.com/user-attachments/assets/a523d72f-822c-4033-bd77-6e24b3aeac5e" />

## 🔄 Ride Status Lifecycle
<img width="686" height="60" alt="image" src="https://github.com/user-attachments/assets/e31d5111-f8d6-4839-9ab2-de6bf501906a" />


---

## 🧠 Core Concepts

- MVC Architecture
- Java Servlets & JSP
- Hibernate ORM with JPA
- Inheritance (**User → Customer / Driver**)
- Session management
- Polling mechanism for live ride updates
- Clean separation of concerns

---

## 🛠️ Technology Stack

| Layer | Technology |
|-----|-----------|
| Frontend | JSP, HTML5, CSS3 |
| Backend | Java, Servlets |
| ORM | Hibernate (JPA) |
| Database | MySQL |
| Server | Apache Tomcat 10 |
| Build Tool | Maven |
| Version Control | Git, GitHub |

---

## 📂 Project Structure
<img width="712" height="864" alt="image" src="https://github.com/user-attachments/assets/66f6dfe1-a6dc-4cdb-adfe-9e692d740e8f" />


---

## 🧾 Database Entities

- User (Base)
- Customer
- Driver
- Ride
- Payment
- Rating
- Vehicle

---

## 🧪 Sample Ride Scenario

Customer requests ride  
→ Fare calculated  
→ Driver accepts  
→ Customer auto-updated  
→ Driver completes ride  
→ Customer pays  
→ Customer rates driver  
→ Customer returns to dashboard  

---

## 📸 Output Screenshots

### 🔐 Login Page
![1](https://github.com/user-attachments/assets/a620f07d-5af1-46f7-98ba-fdf9bf1e80ef)

### 🏠 Dashboard
![2](https://github.com/user-attachments/assets/e6309e5e-1050-4e13-9790-fc149dae86e5)

### 📍 Request Ride & Available Ride
![3](https://github.com/user-attachments/assets/90219bdf-7262-4e6a-b1ab-1aa4b0bedd6a)

### 💰 Fare Details
![4](https://github.com/user-attachments/assets/dbb28adf-93d1-4ebd-a9f9-d00d92892658)

### ⏳ Waiting for Driver
![5](https://github.com/user-attachments/assets/99596855-45ff-4e49-917e-eb1d5d0a4834)

### ✅ Ride Accepted (Customer View & Driver View)
![6](https://github.com/user-attachments/assets/63edd65f-c842-47a0-be29-2d3eed3ab3c3)

### ✔️ Ride Completed (Redirected to Payment)
![7](https://github.com/user-attachments/assets/6e992c70-56ce-4317-807e-52ac0dd3d3f2)

### ⭐ Rating Page
![8](https://github.com/user-attachments/assets/6219dd4b-7fff-4c86-aa83-b6391fd83786)

---

## 🔐 Authentication & Sessions

- Single login for Customer and Driver
- Session attributes:
  - `loggedInUser`
  - `ride`
- Role-based UI rendering
- Safe redirections

---

## 🚀 How to Run

1. Clone repository
   ```bash
   git clone https://github.com/webmaestro2002/ride-hailing-app.git 

<img width="1226" height="510" alt="image" src="https://github.com/user-attachments/assets/7e3a9cdf-37da-4f7a-b8d3-10f5dd88bc4d" />




