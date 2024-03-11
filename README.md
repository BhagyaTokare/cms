# CMS API Documentation

## Super Admin Credentials

Username: cms_super_admin
Password: cms@314159


## Sign-in Request
### Description
This endpoint is used to authenticate a user and obtain an access token.

### Request


```
curl -X POST \
  'http://localhost:8888/api/auth/signIn' \
  -H 'Accept: */*' \
  -H 'Content-Type: application/json' \
  -d '{
  "usernameOrEmail": "admin",
  "password": "admin"
}'
```
#### Request Body Parameters
usernameOrEmail (string): The username or email of the user.
password (string): The password of the user.

### Response Body
```
{
  "status": 200,
  "message": "Authenticated",
  "data": {
    "accessToken": "<token>",
    "tokenType": "Bearer"
  }
}

```
status (integer): The HTTP status code indicating the success of the request.
message (string): A message indicating the status of the authentication process.
data.accessToken (string): The access token required for accessing protected endpoints.
data.tokenType (string): The type of token (e.g., Bearer).

## Sign-up Request
### Endpoint :POST /api/auth/signup
#### Description
This endpoint is used to register a new user. 
#### Request
```
curl -X 'POST' \
  'http://localhost:8888/api/auth/signup' \
  -H 'accept: */*' \
  -H 'Content-Type: application/json' \
  -d '{
  "name": "admin",
  "username": "admin",
  "email": "admin@test.com",
  "password": "admin@123"
}'
```
#### Request Body Parameters
name (string): The name of the user.
username (string): The username chosen by the user.
email (string): The email address of the user.
password (string): The password chosen by the user.

## Admin Sign-up (Only accessible by Super Admin)

### Endpoint POST /api/auth/admin/signup
#### Description
This endpoint is used by the super admin to create a new admin user.

#### Request
```
curl -X 'POST' \
  'http://localhost:8888/api/auth/admin/signup' \
  -H 'accept: */*' \
  -H 'Authorization: Bearer <tocken> -H 'Content-Type: application/json' \
  -d '{
  "name": "admin1",
  "username": "admin1",
  "email": "admin1",
  "password": "admin1"
}'
```
#### Request Body Parameters
name (string): The name of the admin user.
username (string): The username chosen by the admin user.
email (string): The email address of the admin user.
password (string): The password chosen by the admin user.
Request Headers
Authorization (string): Bearer token obtained from the sign-in request of the super admin.