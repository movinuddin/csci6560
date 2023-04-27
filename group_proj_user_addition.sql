

CREATE USER 'username'@'addr' IDENTIFIED BY 'hashed_password';

INSERT INTO users (
    f_name,
    l_name,
    username,
    resultant_hash,
    account_number,
    email_address,
    user_role
) VALUES (
    'John',
    'Doe',
    'WhoAmI',
    '8913X^u258895034y890&^%@!@5t9r#780%4h9fh',
    (
        SELECT account_number
        FROM accounts
        WHERE account_name = 'The Corporation Company Legal Department'
    ),
    'jdoe@thecorporationcompany.com',
    'new_user'
);

-- Admin
START TRANSACTION;
UPDATE users SET user_role = 'admin' WHERE username = 'WhoAmI' WITH GRANT OPTION;
GRANT ALL ON our_database TO 'WhoAmI'@'localhost';
COMMIT;

START TRANSACTION;
UPDATE users SET user_role = 'contributor' WHERE username = 'WhoAmI';
REVOKE ALL ON our_database FROM 'WhoAmI'@'localhost';
GRANT INSERT, SELECT, UPDATE ON our_database TO 'WhoAmI'@'localhost';
COMMIT;

-- Read/Write
START TRANSACTION;
UPDATE users SET user_role = 'read_write' WHERE username = 'WhoAmI';
REVOKE ALL ON our_database FROM 'WhoAmI'@'localhost';
GRANT SELECT, UPDATE ON our_database TO 'WhoAmI'@'localhost';
COMMIT;

-- Worker User
START TRANSACTION;
UPDATE users SET user_role = 'worker' WHERE username = 'WhoAmI';
REVOKE ALL ON our_database FROM 'WhoAmI'@'localhost';
GRANT SELECT ON our_database TO 'WhoAmI'@'localhost';
COMMIT;

-- Reader
START TRANSACTION;
UPDATE users SET user_role = 'reader' WHERE username = 'WhoAmI';
REVOKE ALL ON our_database FROM 'WhoAmI'@'localhost';
GRANT SELECT ON our_database TO 'WhoAmI'@'localhost';
COMMIT;
