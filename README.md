## Problem 1: Comprehensive User Behavior Tracking System

### 1. Collecting the Right Data for Analysis
We gather key data to track user behaviors, structured in the ER diagram. Here's how the data flows:

- **User Registration & Status** (`USERS` table): Tracks user activity—install/uninstall and last seen.
- **Course Interactions** (`USER_COURSE_INTERACTIONS` table): Logs course clicks, wishlist/cart additions, purchase attempts, and progress.
- **Session Tracking** (`USER_APP_SESSIONS` table): Captures each session—app open/close, session duration, features used, and navigation history.
- **Quiz Performance** (`QUIZ_ATTEMPTS` table): Logs quiz attempts, responses, completion speed, and success rates.
- **Purchase Behavior** (`USER_PURCHASES` table): Tracks cart additions, purchase attempts, completed transactions, and payment status.

By organizing data like user details, course activities, and purchases, we can analyze behaviors to enhance user experience and decision-making.

![ER Diagram here](database/ER_Diagram.png)

### 2. Steps of Execution
- **Database Creation:** SQL database with tables for users, courses, modules, and quizzes.
- **Indexes:** Implemented to enhance query performance.
- **Denormalized Views:** Created for easier visualization from normalized data.
  - Schema available in the [database.sql](database/database.sql).

- **Stored Procedures:** Utilized for data processing and metric calculations.
  - Available in the [stored_procedures.sql](database/stored_procedures.sql).
  - **Advantages:**
    - **Performance:** Speeds up execution through precompilation.
    - **Security:** Encapsulates business logic and limits direct access.
    - **Maintainability:** Easier to maintain and reuse across applications.
    - **Transaction Management:** Ensures data integrity and consistency.

### 3. Daily MIS Tracking

The Daily MIS report highlights key performance metrics for actionable insights:

- **New User Registration & Activity:**  
   - **Tracks:** New users, active users, and uninstalls.  
   - **Why it Matters:** Measures user acquisition, retention, and churn.

- **Conversion Rates:**  
   - **Formula:** (Conversions / Total Visitors) * 100  
   - **Why it Matters:** Reflects how effectively users convert into paying customers.

- **Course Clicks & Purchase Attempts:**  
   - **Tracks:** Page/Screen Views per Session  
   - **Why it Matters:** Highlights course interest and friction points in the purchase process.

- **Course Completion & User Retention:**  
   - **Formula:** ((Users at End - New Users) / Users at Start) * 100  
   - **Why it Matters:** Indicates user satisfaction and content quality.

- **Quiz Participation & Success Rates:**  
   - **Tracks:** Time on Page = Total Time / Number of Sessions  
   - **Why it Matters:** Helps refine quiz content by identifying trends in participation and performance.

- **Average Daily Time Spent:**  
   - **Tracks:** Session duration  
   - **Why it Matters:** Measures overall app engagement and usage.

- **Timing of Maximum Uninstalls & Purchases:**  
   - **Tracks:** Click-Through Rates (CTR)  
   - **Why it Matters:** Pinpoints churn and conversion touchpoints.

These metrics help guide improvements, ensuring alignment with both user needs and business outcomes.

### 4. Tools & Technologies
- **Figma:** To create company-specific, uniform reporting templates for clarity and consistency.
- **Tableau:** For interactive dashboards that provide stakeholders with insights through data visualization, using Figma templates.

Links to the Tableau and Figma templates will be added here. Meanwhile, feel free to explore my other [Tableau Dashboards](https://public.tableau.com/views/MintClassicCompany/F_Warehouses?:language=en-US&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link).

In addition, I’ve been promoting financial literacy with NISM and have participated in SEBI national-level competitions in Mumbai. Here's my [resume](https://drive.google.com/file/d/1yyNwcVv1eiETabK3F5CyGD7BCjRqYDXU/view?usp=sharing).
