const bcrypt = require('bcrypt');
const saltRounds = 10;
const myPlaintextPassword = 's0/\/\P4$$w0rD';
const someOtherPlaintextPassword = 'not_bacon';

const salt = bcrypt.genSaltSync(saltRounds);
const hash = bcrypt.hashSync(myPlaintextPassword, salt);

console.log("This is the salt: ", salt);
console.log("This is the hash: ", hash, "\n");

// Load hash from your password DB.
bcrypt.compare(myPlaintextPassword, hash, function(err, result) {
    // result == true
    console.log("First password test")
    console.log(result);
    console.log(typeof(result));
    if (result == false)
        console.log("False. Access denied.\n");
    else {
        console.log("Password matches. Access granted.\n");
    }
});

bcrypt.compare(someOtherPlaintextPassword, hash, function(err, result) {
    // result == false
    console.log("Second password test")
    console.log(result);
    console.log(typeof(result));
    if (result == false)
        console.log("False. Access denied.\n");
    else {
        console.log("Password matches. Access granted.\n");
    }
});