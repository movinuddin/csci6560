USE bigdata;

CREATE TABLE IF NOT EXISTS users (
    id_number INT UNSIGNED NOT NULL AUTO_INCREMENT,
    f_name VARCHAR(255),
    l_name VARCHAR(255),
    username VARCHAR(255),
    resultant_hash VARCHAR(1023) NOT NULL,
    account_number INT UNSIGNED,
    email_address VARCHAR(512),
    user_role ENUM('new_user', 'reader', 'read_write', 'worker', 'contributor', 'admin'),
    PRIMARY KEY(id_number)
);

CREATE TABLE IF NOT EXISTS accounts (
    account_number INT UNSIGNED NOT NULL,
    account_name VARCHAR(255),
    primary_contributor INT UNSIGNED,
    email_address VARCHAR(511),
    phone_number VARCHAR(31),
    PRIMARY KEY(account_number)
);

CREATE TABLE IF NOT EXISTS dataset (
    dataset_number INT UNSIGNED NOT NULL,
    account_number INT UNSIGNED,
    dataset BLOB,
    PRIMARY KEY(dataset_number)
);

CREATE TABLE IF NOT EXISTS processed_data (
    query_number INT UNSIGNED,
    query_name VARCHAR(255),
    account_number INT UNSIGNED,
    dataset BLOB
);