# bullspree_analyst_assignment
**Help Bullspree Optimize User Insights and Retention Strategies!**

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
