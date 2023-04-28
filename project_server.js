// Required modules
const mysql = require('mysql');
const fs = require('fs');

// Creating an instance of a mysql connection database object.
// Connecting to the database.
const connection = mysql.createConnection({
    host: '127.0.0.1',
    user: 'root',
    password: 'password',
    database: 'bigdata'
});

// Informing the user that the connection will try to be established.
console.log("Trying to establish connection with the database.");


connection.connect(function(err)  {
    console.log();
    if (err) {
        throw err.message;
    }

    // Successfully established a connection to the database message.
    console.log("Successfully connected to the database.");

});

var queries = [];
queries.push('SELECT * FROM users');
//queries.push('SELECT * FROM department');
//queries.push("SELECT Fname, Minit, Lname, Address \
//from employee JOIN department on Dno = Dnumber \
//WHERE Dname = 'Research'")

// Gets the query from the database.
connection.query(queries[0], function(err, row, result) {
    if (err) {
        // Prints the err if one occured during the query.
        console.log(err);
    }
    else {
        // Prints query result in json format.
        console.log(row);
        // Prints query result structure in json format.
        //console.log(result)

        fs.writeFile('database_query_test_file.json', JSON.stringify(row), function(err) {
            if (err) throw err;
            console.log('Written to file');
        });
    }
});

connection.end((err) => {
    // Safely ends the connection with the database.
    console.log('You have been disconnected from the database');

});