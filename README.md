## Problem 1: Comprehensive User Behavior Tracking System

### 1. Collecting the Right Data for Analysis:
We gather key data to track important user behaviors, with everything neatly structured in the ER diagram. Here’s how the data flows:
- **User Registration & Status** (`USERS` table): From the moment a user signs up, we track their activity—whether they install or uninstall the app, and their last seen timestamp.
- **Course Interactions** (`USER_COURSE_INTERACTIONS` table): We log every time a user clicks on a course, adds something to their wishlist or cart, attempts a purchase, and how far they progress in the course.
- **Session Tracking** (`USER_APP_SESSIONS` table): Every app session is captured, including when users open or close the app, how long they stay active, which features they use, and their navigation history.
- **Quiz Performance** (`QUIZ_ATTEMPTS` table): We track when users start a quiz, how they respond to each question, how quickly they finish, and their success rates.
- **Purchase Behavior** (`USER_PURCHASES` table): Every cart addition, purchase attempt, and completed transaction is logged, along with the payment status.

By organizing all this data—such as user details, course activities, and purchases—we can analyze user behaviors to enhance their experience and drive better decision-making.

You can view the [ER Diagram here](database/ER_Diagram.png).

### 2. Steps of Execution:
An SQL database was created with tables for users, courses, modules, and quizzes. Indexes were implemented to enhance query performance, and denormalized views were created for easier visualization from normalized data. You can find the database schema in the [database.sql](database/database.sql).

Stored procedures were utilized for data processing and metric calculations. These procedures can be automated using Python scripts to generate metrics on demand. The stored procedures can be found in the [stored_procedures.sql](database/stored_procedures.sql).

**Advantages of Stored Procedures:**
- **Performance:** Stored procedures provide better performance through precompilation, which can speed up execution time.
- **Security:** They enhance security by encapsulating business logic and limiting direct access to data.
- **Maintainability:** They allow for easier maintainability and reusability across different applications.
- **Transaction Management:** They ensure robust transaction management, maintaining data integrity and consistency.

### 3. Daily MIS Tracking:
The Daily MIS report should encompass key performance metrics that reflect user engagement and course performance. Essential metrics to visualize include:

- **User Registration and Activity:** Total new users, active users, and uninstalls.
- **Course Interactions:** Number of course clicks, wishlist additions, and progress completion rates.
- **Session Analytics:** Average session duration and feature usage statistics.
- **Quiz Performance:** Average scores, quiz attempts, and completion rates.
- **Purchase Behavior:** Total purchases, revenue generated, and cart abandonment rates.

For effective visualization and analysis, the following tools and technologies should are used: 

- **Figma:** Using Figma to create drafts of company-specific, uniform reporting templates that enhance clarity and consistency.
- **Tableau:** Implement Tableau for interactive dashboards that allow stakeholders to quickly grasp insights through visual data representation using figma templates.

Links for the Tableau and Figma templates will be added here for this assignment! In the meantime, check out my other dashboards involving similar work. [Tableau Dashboards](https://public.tableau.com/views/MintClassicCompany/F_Warehouses?:language=en-US&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link)
