CREATE TABLE
    IF NOT EXISTS accounts(
        id VARCHAR(255) NOT NULL primary key COMMENT 'primary key',
        createdAt DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT 'Time Created',
        updatedAt DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Last Update',
        name varchar(255) COMMENT 'User Name',
        email varchar(255) COMMENT 'User Email',
        picture varchar(255) COMMENT 'User Picture'
    ) default charset utf8 COMMENT '';

-- SECTION Penguins

-- CREATE TABLE penguins(

--   id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,

--   name TEXT NOT NULL,

--   age INT DEFAULT 1,

--   species TEXT,

--   wearingTuxedo BOOLEAN DEFAULT true

-- );

CREATE TABLE
    penguins(
        id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
        name VARCHAR(255) NOT NULL,
        age INT DEFAULT 1,
        species VARCHAR(5000),
        wearingTuxedo BOOLEAN DEFAULT true
    );

INSERT INTO
    penguins (name, age, species)
VALUES ("Penny", 2, "Macaroni");

INSERT INTO
    penguins (name, species)
VALUES (
        "Rocky",
        "Southern Rock Hopper"
    );

INSERT INTO penguins (name) VALUES ("Stinky");

INSERT INTO penguins (name, wearingTuxedo) VALUES ("Sloopy", false);

SELECT * FROM penguins LIMIT 1;

SELECT name, species FROM penguins WHERE id =1;

SELECT
    id,
    name,
    species,
    wearingTuxedo
FROM penguins
WHERE wearingTuxedo = true;

SELECT
    id,
    name,
    species,
    wearingTuxedo
FROM penguins
WHERE id > 2 AND id < 4;

SELECT name FROM penguins WHERE name LIKE "%y%";

UPDATE penguins SET `wearingTuxedo` = false WHERE id = 4 ;

DELETE FROM penguins WHERE id = 7;

-- SECTION Cars

CREATE TABLE
    cars(
        id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
        make VARCHAR(100) NOT NULL,
        model VARCHAR(100) NOT NULL,
        year INT NOT NULL DEFAULT 1990,
        price DOUBLE NOT NULL DEFAULT 1.00,
        color VARCHAR(100) NOT NULL,
        description VARCHAR(500),
        createdAt DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT 'Time Created',
        updatedAt DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
    ) default charset utf8 COMMENT '';

INSERT INTO
    cars (
        make,
        model,
        year,
        price,
        color,
        description
    )
VALUES (
        "Fast",
        "Chevy",
        2023,
        20000,
        "Pearly",
        "Kinda looks like a knock-off cyber truck, which actually says a lot."
    );

INSERT INTO
    cars (
        make,
        model,
        year,
        price,
        color,
        description
    )
VALUES (
        "Mazda",
        "Miata",
        2023,
        34,
        "White",
        "1/57 scale model car. Assembled by the most handsome instructor."
    );

INSERT INTO
    cars (
        make,
        model,
        year,
        price,
        color,
        description
    )
VALUES (
        "Mazda",
        "RX7",
        2022,
        120,
        "Black",
        "1/57 scale model car. New in Packaging. You will need your own tools to assemble."
    );

INSERT INTO
    cars (
        make,
        model,
        year,
        price,
        color,
        description
    )
VALUES (
        "Dodge",
        "Baha",
        1993,
        7200,
        "Red",
        "Great shape, drives fast, and good on sand. Just needs wheels."
    );

INSERT INTO
    cars (
        make,
        model,
        year,
        price,
        color,
        description
    )
VALUES (
        "Toyota",
        "Scorpion",
        2000,
        9000,
        "Black",
        "For all your FAST and FAMILY needs."
    );

SELECT * FROM cars WHERE id = LAST_INSERT_ID();

SELECT * FROM cars ORDER BY `createdAt` DESC;

SELECT * FROM cars WHERE price < 8000 ORDER BY price DESC;

SELECT *
FROM cars
WHERE description LIKE "%1/57%"
ORDER BY price ASC;

SELECT *
FROM cars
WHERE description LIKE "%1/57%"
ORDER BY price ASC
LIMIT 1, 100;

SELECT * FROM cars WHERE id = 100;

-- NOTE THIS IS THE HOUSES SECTION

CREATE TABLE
    houses(
        id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
        year INT NOT NULL DEFAULT 1950,
        price DOUBLE NOT NULL DEFAULT 100000,
        color VARCHAR(100) NOT NULL,
        bathrooms INT NOT NULL DEFAULT 1,
        bedrooms INT NOT NULL DEFAULT 1,
        description VARCHAR(1000),
        createdAt DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT 'Time Created',
        updatedAt DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
    ) default charset utf8 COMMENT '';

INSERT INTO
    houses (
        year,
        price,
        color,
        bathrooms,
        bedrooms,
        description
    )
VALUES (
        2023,
        200000,
        "Blue",
        3,
        2,
        "A beautiful home, built right on the river! Only a five minute bike ride from town!"
    );

INSERT INTO
    houses (
        year,
        price,
        color,
        bathrooms,
        bedrooms,
        description
    )
VALUES (
        1988,
        120000,
        "Red",
        3,
        4,
        "Good for a first time homebuyer. Friendly neighborhood! Close to a few hiking paths"
    );

INSERT INTO
    houses (
        year,
        price,
        color,
        bathrooms,
        bedrooms,
        description
    )
VALUES (
        2023,
        360000,
        "Yellow",
        4,
        6,
        "This pretty little seaside house has all the amenities you need! Quick grocery shopping areas, and really close to the city mall!"
    );

INSERT INTO
    houses (
        year,
        price,
        color,
        bathrooms,
        bedrooms,
        description
    )
VALUES (
        1951,
        70000,
        "Green",
        2,
        3,
        "An old house, but that's part of the excitement! If your kids go missing, make sure to check under the floorboards! Rickety and very unstructurally sound, and i don't even know if that's a word! Good luck or whatever!"
    );

INSERT INTO
    houses (
        year,
        price,
        color,
        bathrooms,
        bedrooms,
        description
    )
VALUES (
        1993,
        153000,
        "BLACK",
        2,
        3,
        "Needs a little work, but overall a beautiful home. The yard was well taken care of, and dogs are welcome! In fact, it's even super close to a few dog parks and even a small outlet mall!"
    );

SELECT * FROM houses WHERE id = LAST_INSERT_ID();

SELECT * FROM houses ORDER BY `createdAt` DESC;

SELECT * FROM houses WHERE price < 50000 ORDER BY price DESC;

SELECT * FROM houses WHERE ID = 1;

CREATE TABLE
    jobs(
        id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
        type VARCHAR(100) NOT NULL,
        title VARCHAR(30) NOT NULL,
        pay DOUBLE NOT NULL DEFAULT 7,
        hours DOUBLE NOT NULL DEFAULT 10,
        description VARCHAR(1000),
        createdAt DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT 'Time Created',
        updatedAt DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
    ) default charset utf8 COMMENT '';

INSERT INTO
    jobs (
        type,
        title,
        pay,
        hours,
        description
    )
VALUES (
        Laborer,
        Roofer,
        20,
        40,
        "Need manual laborers! Hard work but pays decent. Call me anytime!"
    );

INSERT INTO
    jobs (
        type,
        title,
        pay,
        hours,
        description
    )
VALUES (
        Nurse,
        Nursing,
        30,
        40,
        "Looking for more certified nurses to help take care of the elderly!"
    );

INSERT INTO
    jobs (
        type,
        title,
        pay,
        hours,
        description
    )
VALUES (
        Restaurant,
        Cook,
        15,
        30,
        "Looking for professional and clean cut cooks to help set the grill ablaze!"
    );

INSERT INTO
    jobs (
        type,
        title,
        pay,
        hours,
        description
    )
VALUES (
        Mower,
        Lawnmower,
        18,
        40,
        "Beginners welcome! Pays good for a first gig! Lots of practice and willing to train the right person."
    );

INSERT INTO
    jobs (
        type,
        title,
        pay,
        hours,
        description
    )
VALUES (
        instructor,
        Software Teacher,
        80000,
        40,
        "We need new teachers! Jake, the CEO, has some badass staff here, but with the influx of new students and the complexity of the course, we are looking to expand on the tutor sides of things. Must have experience coding of 5+ years."
    );