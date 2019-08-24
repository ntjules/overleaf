#README
## App Table and schema

| Table | Model | Colum_name | Data_type |
|-------|-------|------------|-----------|
| users | user  | user_id    | string    |
|       |       | user_type  | string    |
|       |       | first_name | string    |
|       |       | last_name  | string    |
|       |       | gender     | string    |
|       |       | email      | string    |
|       |       | image      | string    |
|       |       | username   | string    |
|       |       | password   | string    |
|       |       | created_at | timestamp |
|       |       | updated_at | timestamp |


| Table | Model | Colum_name   | Data_type |
|-------|-------|--------------|-----------|
| tasks | task  | task_id      | string    |
|       |       | deadline     | timestamp |
|       |       | task_title   | string    |
|       |       | task_content | text      |
|       |       | task_status  | string    |
|       |       | created_at   | timestamp |
|       |       | updated_at   | timestamp |


| Table  | Model | Colum_name | Data_type |
|--------|-------|------------|-----------|
| labels | label | label_id   | string    |
|        |       | label      | string    |
|        |       | created_at | timestamp |
|        |       | updated_at | timestamp |


App fuctionalities
-------------------

- register  task easily
- set a deadline for tasks
- prioritize tasks
- manage the status (not started, started, completed)
- narrow down the tasks by status
- list the tasks, sort on the list screen (based on priority, end date, etc.)
- label tasks and classify them
- register as a user and see only the tasks I registered