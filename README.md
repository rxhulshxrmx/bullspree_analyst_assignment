## Problem 1: Comprehensive User Behavior Tracking System

### 1. Collecting the Right Data for Analysis:
We gather key data to track important user behaviors, with everything neatly structured in the ER diagram. Here’s how the data flows:
- **User Registration & Status** (`USERS` table): From the moment a user signs up, we track their activity—whether they install or uninstall the app, and their last seen timestamp.
- **Course Interactions** (`USER_COURSE_INTERACTIONS` table): We log every time a user clicks on a course, adds something to their wishlist or cart, attempts a purchase, and how far they progress in the course.
- **Session Tracking** (`USER_APP_SESSIONS` table): Every app session is captured, including when users open or close the app, how long they stay active, which features they use, and their navigation history.
- **Quiz Performance** (`QUIZ_ATTEMPTS` table): We track when users start a quiz, how they respond to each question, how quickly they finish, and their success rates.
- **Purchase Behavior** (`USER_PURCHASES` table): Every cart addition, purchase attempt, and completed transaction is logged, along with the payment status.

By organizing all this data—such as user details, course activities, and purchases—we can analyze user behaviors to enhance their experience and drive better decision-making.

![ER_Diagram](https://github.com/user-attachments/assets/9db3a41a-d02c-4029-b207-ee654f6af73b)

### 2. Steps of Execution:
An SQL database was created with tables for users, courses, modules, and quizzes. Indexes were implemented to enhance query performance, and denormalized views were created for easier visualization from normalized data.
[database.sql](database/database.sql)

Stored procedures were utilized for data processing and metric calculations. These procedures can be automated using Python scripts to generate metrics on demand.
[stored_procedures.sql](database/stored_procedures.sql)

**Advantages of Stored Procedures:**
- **Performance:** Stored procedures provide better performance through precompilation, which can speed up execution time.
- **Security:** They enhance security by encapsulating business logic and limiting direct access to data.
- **Maintainability:** They allow for easier maintainability and reusability across different applications.
- **Transaction Management:** They ensure robust transaction management, maintaining data integrity and consistency.


### 3. Daily MIS Tracking:
write about key metrics which are visulaized here, and what should daily report conatainn
(- Design a daily MIS report format to track and visualize key metrics.
- Recommend tools and technologies for generating and maintaining the MIS - Figma to create a draft for company specififc uniformed reporting and used in tableau for presentations and quickly grasping things. Excel dashboard for ad-hoc reporting) I will add excel and tableau dashboard links here



### 4. Data-Driven Suggestions:
(- Provide actionable insights based on the data collected.
- Suggest strategies to enhance user engagement and optimize the user journey.)


