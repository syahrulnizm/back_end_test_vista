Step to Run

1. **Install dependencies**

   npm install

2. **Configure the Database**

   - Make sure your MySQL server is running.
   - Import the provided SQL file I put on this repo to create the database and tables and dummy data:

     mysql -u root -p < vista-db.sql

   - By default, the app connects to MySQL with user `root` and no password. Update `db.js` if your credentials differ.

4. **Start the server**

   node app.js

   The server will run at `http://localhost:3000`

## API Endpoints

### Companies
- `POST /companies` — Create a new company
  - Body: `{ "name": string, "registrationNumber": string }`
  - Example:
      {
         "name": "Vista Inc.",
         "registrationNumber": "V12345"
      }
- `GET /companies` — List all companies with their services

### Services
- `POST /services` — Create a new service under a company
  - Body: `{ "companyId": number, "name": string, "description"?: string, "price": number }`
  - Example:
      {
         "companyId": 6,
         "name": "Cloud Consulting",
         "description": "Expert advice on cloud infrastructure.",
         "price": 2000.00
      }
- `GET /services/:id` — Get service details by ID