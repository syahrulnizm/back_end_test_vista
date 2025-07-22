const express = require('express');
const pool = require('./db');
const app = express();
const port = 3000;

app.use(express.json());

// test api
app.get('/', (req, res) => {
  res.send('Hello World!');
});

// create a new company
app.post('/companies', async (req, res) => {
  try {
    const { name, registrationNumber } = req.body;
    if (!name || !registrationNumber) {
      return res.status(400).send('Company name and registration number are required');
    }
    const [result] = await pool.query('INSERT INTO company (name, registrationNumber) VALUES (?, ?)', [name, registrationNumber]);
    res.status(201).json({ id: result.insertId, name, registrationNumber });
  } catch (error) {
    console.error(error);
    res.status(500).send('Error creating company');
  }
});

// list all companies with their services
app.get('/companies', async (req, res) => {
  try {
    const [companies] = await pool.query('SELECT * FROM company');
    for (const company of companies) {
      const [services] = await pool.query('SELECT * FROM service WHERE companyId = ?', [company.id]);
      company.services = services;
    }
    res.json(companies);
  } catch (error) {
    console.error(error);
    res.status(500).send('Error retrieving companies');
  }
});

// create a service under a company
app.post('/services', async (req, res) => {
  try {
    const { companyId, name, description, price } = req.body;
    if (!companyId || !name || !price) {
      return res.status(400).send('Company ID, service name, and price are required');
    }
    const [result] = await pool.query('INSERT INTO service (companyId, name, description, price) VALUES (?, ?, ?, ?)', [companyId, name, description, price]);
    res.status(201).json({ id: result.insertId, companyId, name, description, price });
  } catch (error) {
    console.error(error);
    res.status(500).send('Error creating service');
  }
});

// get service details by ID
app.get('/services/:id', async (req, res) => {
  try {
    const { id } = req.params;
    const [services] = await pool.query('SELECT * FROM service WHERE id = ?', [id]);
    if (services.length === 0) {
      return res.status(404).send('Service not found');
    }
    res.json(services[0]);
  } catch (error) {
    console.error(error);
    res.status(500).send('Error retrieving service');
  }
});

app.listen(port, () => {
  console.log(`Server running at http://localhost:${port}`);
});
