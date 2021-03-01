# loginsrv
Simple JWT based login server in rust, with database

# Development

To start everything:

```
docker-compose up
```

To perform database migrations:

```
docker-compose liquibase update
```

Rollback:

```
docker-compose liquibase rollbackCount 1
```
