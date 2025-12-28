README.md:
  title: "🚕 Ride Hailing App"
  subtitle: "Java | JSP | Servlets | Hibernate | MySQL"

  description: >
    A full-stack Java web application that simulates a real-world
    ride-hailing platform with Customer and Driver roles.
    Built using core Java Web technologies (no Spring),
    following a clean MVC architecture.

  highlights:
    - "Role-based login (Customer / Driver)"
    - "Real-time ride status updates"
    - "Complete ride lifecycle"
    - "Hibernate ORM (JPA)"
    - "JSP-based UI with clean CSS"
    - "Session-based authentication"
    - "Industry-style backend flow"

  application_flow:
    customer:
      - "🔐 Login"
      - "📍 Request Ride"
      - "💰 Fare Calculation"
      - "⏳ Waiting for Driver (REQUESTED)"
      - "✅ Ride Accepted (ACCEPTED)"
      - "🚕 Ride In Progress"
      - "💳 Payment"
      - "⭐ Rating"
      - "🏠 Customer Dashboard (Book a Ride)"

    driver:
      - "🔐 Login"
      - "📋 View Available Rides"
      - "👍 Accept Ride"
      - "🚕 Ride In Progress"
      - "✔️ Complete Ride"
      - "📋 Available Rides"

  ride_status_lifecycle:
    - "REQUESTED → ACCEPTED → COMPLETED"

  core_concepts:
    - "MVC Architecture"
    - "Java Servlets & JSP"
    - "Hibernate ORM with JPA"
    - "Inheritance (User → Customer / Driver)"
    - "Session management"
    - "Polling mechanism for live ride updates"
    - "Clean separation of concerns"

  technology_stack:
    frontend: ["JSP", "HTML5", "CSS3"]
    backend: ["Java", "Servlets"]
    orm: ["Hibernate (JPA)"]
    database: ["MySQL"]
    server: ["Apache Tomcat 10"]
    build_tool: ["Maven"]
    version_control: ["Git", "GitHub"]

  project_structure: |
    ride-hailing-app
    ├── src/main/java
    │   └── com.training.project.rideapp
    │       ├── controller   🚦 (Servlets)
    │       ├── service      🧠 (Business Logic)
    │       ├── repo         🗄️ (Hibernate Repositories)
    │       ├── model        📦 (Entities & Enums)
    │       └── util         ⚙️ (Hibernate Utility)
    ├── src/main/webapp
    │   ├── jsp              🖥️ (JSP Views)
    │   ├── css              🎨 (Styling)
    │   └── index.jsp
    ├── pom.xml
    └── README.md

  database_entities:
    - "User (Base class)"
    - "Customer"
    - "Driver"
    - "Ride"
    - "Payment"
    - "Rating"
    - "Vehicle"

  sample_ride_scenario:
    - "Customer requests ride"
    - "Fare calculated automatically"
    - "Driver sees ride in Available Rides"
    - "Driver accepts ride"
    - "Customer auto-updates to Ride Accepted"
    - "Driver completes ride"
    - "Customer pays"
    - "Customer rates driver"
    - "Customer returns to dashboard"

  authentication_and_sessions:
    login_type: "Single login for Customer and Driver"
    session_attributes:
      - "loggedInUser"
      - "ride"
    ui_rendering: "Role-based using instanceof"
    security: "Safe redirections and session checks"

  how_to_run:
    steps:
      - "Clone repository"
      - "Import as Maven project in Eclipse"
      - "Configure MySQL and hibernate.cfg.xml"
      - "Run on Apache Tomcat 10"
    access_url: "http://localhost:8080/ride-hailing-app"

