# Construction MIS - Debug Report

## Date: 2026-02-02
## Debugged Components: Services and Controllers

---

## Issues Found and Fixed

### 1. **ProjectController.java - Critical Bug**
**Issue:** Line 31 called `projectService.deleteProject(id)` with an `int` parameter, but the service only had a method accepting a `Project` object.

**Fix:** Added an overloaded `deleteProject(int id)` method in `ProjectService` that:
- Fetches the project by ID
- Checks if it exists
- Calls the delete method with the Project object

**Impact:** This would have caused a compilation error preventing the application from running.

---

### 2. **User.java Model - Missing JPA Requirements**
**Issue:** The User entity was missing:
- No-argument constructor (required by JPA/Hibernate)
- `@PrePersist` method to automatically set `createdAt` timestamp

**Fix:** 
- Added no-arg constructor
- Added `@PrePersist` method with `onCreate()` to set `createdAt` automatically

**Impact:** Without these, Hibernate couldn't instantiate User objects from database queries, causing runtime errors.

---

### 3. **Empty DAO Classes**
**Issue:** Four DAO classes were completely empty:
- `TaskDAO.java`
- `UserDAO.java`
- `DelayDAO.java`
- `ReportDAO.java`

**Fix:** Implemented complete DAO classes with:

#### TaskDAO
- Basic CRUD operations (save, findById, findAll, update, delete)
- `findByProjectId(int projectId)` - Get all tasks for a project
- `findByUserId(int userId)` - Get all tasks assigned to a user
- `findByStatus(String status)` - Filter tasks by status

#### UserDAO
- Basic CRUD operations
- `findByEmail(String email)` - For login functionality
- `findByRole(String role)` - Get users by role (ADMIN, PROJECT_MANAGER, ENGINEER)
- `emailExists(String email)` - Validation for registration

#### DelayDAO
- Basic CRUD operations
- `findByProjectId(int projectId)` - Get delays for a project
- `findByTaskId(int taskId)` - Get delays for a specific task
- `findByStatus(String status)` - Filter by delay status
- `findByReportedBy(int userId)` - Get delays reported by a user

#### ReportDAO
- Basic CRUD operations
- `findByProjectId(int projectId)` - Get reports for a project
- `findByStatus(String status)` - Filter by report status
- `findByGeneratedBy(int userId)` - Get reports created by a user

**Impact:** Without these implementations, no database operations would work for these entities.

---

### 4. **Empty Service Classes**
**Issue:** Four Service classes were completely empty:
- `TaskService.java`
- `UserService.java`
- `DelayService.java`
- `ReportService.java`

**Fix:** Implemented complete Service classes with business logic:

#### TaskService
- All CRUD operations
- Task filtering by project, user, and status
- Overloaded `deleteTask(int id)` method

#### UserService
- All CRUD operations
- `authenticate(String email, String password)` - Login functionality
- `isEmailAvailable(String email)` - Registration validation
- User filtering by role
- Overloaded `deleteUser(int id)` method

**Note:** Password comparison is currently plain text. **TODO:** Implement password hashing (BCrypt) for production.

#### DelayService
- All CRUD operations
- Delay filtering by project, task, status, and reporter
- Overloaded `deleteDelay(int id)` method

#### ReportService
- All CRUD operations
- Report filtering by project, status, and generator
- Overloaded `deleteReport(int id)` method

**Impact:** Without these services, the controller layer had no business logic to interact with.

---

## Additional Critical Issues Found During Compilation

### 5. **Controller Naming Conflicts - CRITICAL**
**Issue:** Four controller servlets had the same names as their corresponding model classes:
- `controllers/Delay.java` conflicted with `models/Delay.java`
- `controllers/Task.java` conflicted with `models/Task.java`
- `controllers/User.java` conflicted with `models/User.java`
- `controllers/Report.java` conflicted with `models/Report.java`

This caused compilation errors because Java cannot have two public classes with the same name in the same package context.

**Fix:** 
- Renamed all controller servlets to follow the `*Controller` naming convention:
  - `Delay.java` → `DelayController.java`
  - `Task.java` → `TaskController.java`
  - `User.java` → `UserController.java`
  - `Report.java` → `ReportController.java`
- Updated class names and `@WebServlet` annotations accordingly

**Impact:** This was preventing the entire project from compiling.

---

### 6. **HibernateUtil Missing getEntityManager() Method**
**Issue:** The `HibernateUtil` class only had `getSessionFactory()` method, but the DAOs and Program.java were trying to use `getEntityManager()` which didn't exist.

**Fix:** Added the following methods to `HibernateUtil`:
```java
public static EntityManager getEntityManager() {
    return sessionFactory.createEntityManager();
}

public static void shutdown() {
    if (sessionFactory != null) {
        sessionFactory.close();
    }
}
```

**Impact:** Without this method, the application couldn't create EntityManager instances for JPA operations.

---

### 7. **Program.java - Improper DAO Initialization**
**Issue:** `Program.java` was trying to create `ProjectDAO` without passing an `EntityManager`:
```java
ProjectDAO projectDAO = new ProjectDAO(); // ❌ Missing EntityManager
```

**Fix:** Updated to properly initialize with EntityManager:
```java
EntityManager em = HibernateUtil.getEntityManager();
ProjectDAO projectDAO = new ProjectDAO(em);
```

Also added proper resource cleanup at the end of the program.

**Impact:** This would have caused a NullPointerException at runtime.

---

### 8. **Incorrect Hibernate Dialect Files**
**Issue:** Found custom Hibernate dialect files in `src/main/java/org/hibernate/dialect/`:
- `MySQL8Dialect.java`
- `MySQLDialect.java`

These are part of the Hibernate library and should NOT be in the project source code.

**Fix:** Deleted the entire `src/main/java/org` directory.

**Impact:** These files could cause conflicts with the actual Hibernate library classes.

---

### 9. **Corrected JSP File Reference**
**Issue:** `ProjectController.java` was forwarding to `project.jsp`, but the actual file in `src/main/webapp` is named `projects.jsp` (plural).

**Fix:** Updated `ProjectController.java` to point to `projects.jsp`.

**Impact:** Accessing the project list would have resulted in a 404 error (File Not Found).

### 10. **Missing Landing Page (index.jsp)**
**Issue:** The application had no root page. Accessing `http://localhost:8080/construction-mis/` would show a 404 error.

**Fix:** Created `src/main/webapp/index.jsp` that automatically retrieves the root URL and redirects to the `ProjectController`.

**Impact:** Users will now be automatically taken to the project list when opening the application.

### 11. **Hibernate Version Mismatch**
**Issue:** The project uses `jakarta.persistence` (Jakarta EE 10) annotations, but the `pom.xml` imported `Hibernate 5.6.15` (which only supports `javax.persistence`). This would cause `NoClassDefFoundError` at runtime.

**Fix:** Upgraded `Hibernate` to `6.4.4.Final` in `pom.xml` and updated the dialect in `hibernate.cfg.xml`.

**Impact:** Prevents critical runtime crash during database operations.

---

## 🚀 How to Run the Application

You have two ways to interact with the project:

### 1. **Testing with `Program.java` (Console Only)**
- This files is just a script to test database operations in the console.
- **Run:** Right-click `Program.java` -> Run 'Program.main()'
- **Output:** Checks the "Run" console tab in IntelliJ. You will NOT see this in the browser.

### 2. **Running the Web Application (Browser)**
- To see the interface in the browser, you must run the Web Server (Tomcat).
- I have added the **Cargo Maven Plugin** to make this easy.
- **Run Command:**
  ```sh
  mvn cargo:run
  ```
- **Accessing the App:**
  - Once started, open your browser to: **[http://localhost:8080/construction-mis/](http://localhost:8080/construction-mis/)**

---

---

## 🔧 Troubleshooting Common Errors

### 🔴 HTTP Status 500 - Connection Link Failure
**Error:** `java.lang.ExceptionInInitializerError` ... `com.mysql.cj.jdbc.exceptions.CommunicationsException`
**Cause:** The application cannot connect to your local MySQL database.
**Solutions:**
1. **Start MySQL:** Ensure your MySQL service is running (Search "Services" in Windows > Find MySQL > Start).
2. **Check Password:** If your root user has a password, you MUST add it to `src/main/resources/hibernate.cfg.xml`:
   ```xml
   <property name="hibernate.connection.password">YOUR_PASSWORD</property>
   ```
3. **Check Port:** Ensure MySQL is running on port **3306**.

---

## Status: ✅ All Critical Issues Fixed & Web Server Configured

The project is now fully debugged and ready to run.

