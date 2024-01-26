PRAGMA foreign_keys = ON;

CREATE TABLE IF NOT EXISTS Categories(
    ID INTEGER PRIMARY KEY NOT NULL CHECK (typeof(ID) = 'integer'),
    category_name TEXT
);

CREATE TABLE IF NOT EXISTS Books(
    ISBN INTEGER PRIMARY KEY NOT NULL CHECK (typeof(ISBN) = 'integer'),
    title TEXT NOT NULL,
    pages INTEGER CHECK (typeof(pages) = 'integer'),
    price REAL CHECK (typeof(price) = 'real'),
    edition_num INTEGER CHECK (typeof(edition_num) = 'integer'),
    print_series INTEGER CHECK (typeof(print_series) = 'integer'),
    category_id INTEGER CHECK (typeof(category_id) = 'integer'),
    FOREIGN KEY (category_id) REFERENCES Categories(ID) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS Publishers(
    ID INTEGER PRIMARY KEY NOT NULL CHECK (typeof(ID) = 'integer'),
    publisher_name TEXT,
    city INTEGER CHECK (typeof(city) = 'integer'),
    manager_name TEXT,
    total_printed INTEGER CHECK (typeof(total_printed) = 'integer'),
    total_revenue REAL CHECK (typeof(total_revenue) = 'real')
);

CREATE TABLE IF NOT EXISTS Authors(
    ID INTEGER PRIMARY KEY NOT NULL CHECK (typeof(ID) = 'integer'),
    author_name TEXT,
    age INTEGER CHECK (typeof(age) = 'integer'),
    total_revenue REAL CHECK (typeof(total_revenue) = 'real')
);

CREATE TABLE IF NOT EXISTS AuthBooks(
    ISBN INTEGER PRIMARY KEY NOT NULL CHECK (typeof(ISBN) = 'integer'),
    author_ID INTEGER NOT NULL CHECK (typeof(author_ID) = 'integer'),
    author_revenue REAL CHECK (typeof(author_revenue) = 'real'),
    FOREIGN KEY (ISBN) REFERENCES Books(ISBN) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (author_ID) REFERENCES Authors(ID) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS PubBooks(
    ISBN INTEGER PRIMARY KEY NOT NULL CHECK (typeof(ISBN) = 'integer'),
    publisher_ID INTEGER NOT NULL CHECK (typeof(publisher_ID) = 'integer'),
    publish_date DATETIME,
    publisher_revenue REAL CHECK (typeof(publisher_revenue) = 'real'),
    FOREIGN KEY (ISBN) REFERENCES Books(ISBN) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (publisher_ID) REFERENCES Publishers(ID) ON UPDATE CASCADE ON DELETE CASCADE
);