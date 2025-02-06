const express = require('express');
const app = express();
const mysql = require('mysql2');


const connection = mysql.createConnection({
  host: 'localhost', 
  user: 'root', // Usuari Base de dades
  password: 'winintin123456789', // Contrasenya Base de dades
  database: 'quiz'
});

connection.connect(error => {
  if (error) throw error;
  console.log('Connectat a la base de dades');
});

app.get('/', (req, res) => {
  res.sendFile(__dirname + '/example.html');
});

app.get("/api/results", (req, res) => {
    connection.query("SELECT * FROM results", (error, results) => {
      if (error) throw error;
      res.send(results);
    });
  });
  
app.listen(3000, () => {
  console.log('API inicialitzada en el port 3000');
});


