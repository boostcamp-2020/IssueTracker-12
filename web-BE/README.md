### Backend directory

```bash
server
|   app.js          # App entry point
├───config          # Environment variables and configs
│   ├───db_connection.js
│   └───query.js
├───models          # Database models
│   ├───auth.js
│   ├───comment.js
│   ├───issue.js
│   ├───label.js
│   └───milestone.js
├───route             # route controllers
│   ├───index.js
│   └───api
│       ├───auth
│       |   ├───controller.js
│       |   └───index.js
│       ├───comment
│       |   ├───controller.js
│       |   └───index.js
│       ├───issue
│       |   ├───comment
│       |   |    ├───comment
│       |   |    ├───controller.js
│       |   |    └───index.js
│       |   ├───controller.js
│       |   └───index.js
│       ├───label
│       |   ├───controller.js
│       |   └───index.js
│       └───milestone
│           ├───controller.js
│           └───index.js
└───services        # All the business logic is here
```