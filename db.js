const mysql = require('mysql2/promise');

// Create a connection pool (recommended for production)
const pool = mysql.createPool({
  host: 'localhost',       // Your MySQL host
  user: 'root',   // Your MySQL username
  password: null, // Your MySQL password
  database: 'vista-db',
  waitForConnections: true,
  connectionLimit: 10,
  queueLimit: 0
});

module.exports = pool;