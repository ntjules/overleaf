#README
## App Table and schema

| Table | Model | Colum_name | Data_type |
|-------|-------|------------|-----------|
| users | user  | id         | string    |
|       |       | type       | string    |
|       |       | first_name | string    |
|       |       | last_name  | string    |
|       |       | gender     | string    |
|       |       | email      | string    |
|       |       | image      | text      |
|       |       | username   | string    |
|       |       | password   | string    |
|       |       | created_at | timestamp |
|       |       | updated_at | timestamp |


| Table | Model | Colum_name   | Data_type |
|-------|-------|--------------|-----------|
| tasks | task  | id           | string    |
|       |       | deadline     | timestamp |
|       |       | title        | string    |
|       |       | content      | text      |
|       |       | status       | string    |
|       |       | user_id      | integer   |
|       |       | created_at   | timestamp |
|       |       | updated_at   | timestamp |


| Table  | Model | Colum_name | Data_type |
|--------|-------|------------|-----------|
| labels | label | id         | string    |
|        |       | label      | string    |
|        |       | user_id    | string    |
|        |       | created_at | timestamp |
|        |       | updated_at | timestamp |

| Table     | Model    | Colum_name | Data_type |
|-----------|----------|------------|-----------|
| labelings | labeling | id         | string    |
|           |          | user_id    |           |
|           |          | task_id    | string    |
|           |          | created_at | timestamp |
|           |          | updated_at | timestamp |


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


## APP INfo
Rails version 6.0.0
Ruby version 2.6.3p62

## Deloy to Heroku
1. Clone this app on your computer with the command
    ``` git clone https://github.com/ntjules/overleaf ```

2. with in the app repository create heroku app with the command 
    ``` heroku create ```

3. Push App to Heroku with the command
    ``` Push changes to Heroku ```

4. Run database migrations on Heroku
    ``` heroku run rails db:migrate ```

5. Visit your application
    ``` heroku open ```