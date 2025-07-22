const express = require('express');
const pool = require('./db'); // Import the database connection

const app = express();
const port = 3000;

// Middleware to parse JSON bodies
app.use(express.json());

// Your existing route
app.get('/', (req, res) => {
    res.send('Hell boss Vista Test!');
});

// New route to test database connection
app.get('/test-db', async (req, res) => {
    try {
        const [rows] = await pool.query('SELECT 1 + 1 AS solution');
        res.json({ 
            message: 'Database connection successful', 
            solution: rows[0].solution 
        });
    } catch (err) {
        console.error(err);
        res.status(500).json({ 
            error: 'Database connection failed',
            details: err.message 
        });
    }
});

// Example CRUD routes

// Create a new item
app.post('/items', async (req, res) => {
    const { name, description } = req.body;
    try {
        const [result] = await pool.query(
            'INSERT INTO items (name, description) VALUES (?, ?)',
            [name, description]
        );
        res.status(201).json({ 
            id: result.insertId, 
            name, 
            description 
        });
    } catch (err) {
        console.error(err);
        res.status(500).send('Server Error');
    }
});

// Get all items
app.get('/items', async (req, res) => {
    try {
        const [rows] = await pool.query('SELECT * FROM items');
        res.json(rows);
    } catch (err) {
        console.error(err);
        res.status(500).send('Server Error');
    }
});

app.listen(port, () => {
    console.log(`Server running at http://localhost:${port}`);
});