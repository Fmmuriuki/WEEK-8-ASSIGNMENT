-- 1. Creating Database 
CREATE DATABASE LibraryDB;

-- 2. Creating  table for Athorse
CREATE TABLE Authors (
    AuthorID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(50) NOT NULL,
    Country VARCHAR(50)
);

-- 3. Creating table for Books
CREATE TABLE Books (
    BookID INT AUTO_INCREMENT PRIMARY KEY,
    Title VARCHAR(100) NOT NULL,
    AuthorID INT,
    ISBN VARCHAR(20) UNIQUE NOT NULL,
    Status ENUM('Available', 'Borrowed', 'Lost') DEFAULT 'Available',
    FOREIGN KEY (AuthorID) REFERENCES Authors(AuthorID)
);

-- 4. Creating table for my members
CREATE TABLE Members (
    MemberID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(50) NOT NULL,
    Email VARCHAR(50) UNIQUE NOT NULL,
    JoinDate DATE DEFAULT (CURRENT_DATE)
);

-- 5. Creating table for Borrowing records
CREATE TABLE Loans (
    LoanID INT AUTO_INCREMENT PRIMARY KEY,
    BookID INT NOT NULL,
    MemberID INT NOT NULL,
    LoanDate DATE DEFAULT (CURRENT_DATE),
    ReturnDate DATE,
    FOREIGN KEY (BookID) REFERENCES Books(BookID),
    FOREIGN KEY (MemberID) REFERENCES Members(MemberID)
);

-- 6. Creating Sample data for Authors COMMENT
INSERT INTO Authors (Name, Country) VALUES 
    ('Ngũgĩ wa Thiong''o', 'Kenya'),
    ('Kithaka Wa Mberia', 'Kenya');
INSERT INTO Books (Title, AuthorID, ISBN) VALUES
    ('The River Between', 1, '101'),
    ('Kifo Kisimani', 2, '102');

-- Registered Members for Library (Felix, Zablon, Gerald, Chakin, Shikuku, Muthoni)
INSERT INTO Members (Name, Email) VALUES
    ('Felix Mwangi', 'felix@gmail.com'),
    ('Zablon Mbeki', 'zablon@gmail.com'),
    ('Gerald Omondi', 'gerald@gmail.com'),
    ('Chakin Mwinyi', 'chakin@gmail.com'),
    ('Shikuku Mwangi', 'shikuku@gmail.com'),
    ('Muthoni Wambui', 'muthoni@gmail.com');

-- 7. Borrowed books by members (Felix, Zablon, Gerald)

-- Felix has borrowed "The River Between" (ISBN 101)
INSERT INTO Loans (BookID, MemberID, LoanDate)
VALUES (
    (SELECT BookID FROM Books WHERE ISBN = '101'),
    (SELECT MemberID FROM Members WHERE Name = 'Felix Mwangi'),
    '2025-05-03'
);

-- Gerald has borrowed "Kifo Kisimani" (ISBN 102)
INSERT INTO Loans (BookID, MemberID, LoanDate)
VALUES (
    (SELECT BookID FROM Books WHERE ISBN = '102'),
    (SELECT MemberID FROM Members WHERE Name = 'Gerald Omondi'),
    '2025-05-04'
);
