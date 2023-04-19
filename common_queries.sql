-- Find all users with a given role
SELECT *
FROM users LEFT JOIN roles ON users.user_role = roles.role_name
WHERE roles.role_name = {};

-- Find all datasets belonging to an account

SELECT *
FROM accounts OUTER JOIN dataset ON accounts.account_number = dataset.account_number
WHERE accounts.account_number = {};

-- Find all users in an account

SELECT *
FROM accounts OUTER JOIN users ON accounts.account_number = users.account_number
WHERE accounts.account_number = {};

-- Look up user by id

SELECT users.*, accounts.account_name
FROM users OUTER JOIN accounts ON users.account_number = accounts.account_number
WHERE id_number={};

-- Look up user by any search param

SELECT users.*, accounts.account_name
FROM users OUTER JOIN accounts ON users.account_number = accounts.account_number
WHERE (f_name={} AND l_name={}) OR username={} OR
      email_address={};

-- Look up user by all search params

SELECT users.*, accounts.account_name
FROM users OUTER JOIN accounts ON users.account_number = accounts.account_number
WHERE {}; -- Whole WHERE section

-- WHERE ["f_name={}", "l_name={}", "username={}", "email_address={}"] AND together all fields that are filled.

-- Look up all queries made by a particular account

SELECT accounts.account_name, processed_data.*
FROM accounts OUTER JOIN processed_data_data ON accounts.account_number = processed_data.account_number
WHERE accounts.{}={};
