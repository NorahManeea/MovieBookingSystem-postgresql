-- Create Database

CREATE DATABASE movie_booking_system;


-- Create Tables

CREATE TABLE user (
    user_id SERIAL PRIMARY KEY,
    user_name VARCHAR(50),
    email VARCHAR(100),
    phone_number VARCHAR(20),
    password VARCHAR(100),
    date_of_birth DATE,
    gender VARCHAR(10)
);



CREATE TABLE user_info (
    user_info_id SERIAL PRIMARY KEY,
    user_id INT,
    additional_attribute VARCHAR(255),
    FOREIGN KEY (user_id) REFERENCES user(user_id)
);


CREATE TABLE movie (
    movie_id SERIAL PRIMARY KEY,
    movie_name VARCHAR(100),
    genre ENUM ('Action', 'Comedy', 'Drama', 'Thriller', 'Animation'),
    movie_description TEXT,
    release_date DATE,
    movie_image VARCHAR(255),
    movie_price DECIMAL(10, 2),
    cast TEXT,
    rating DECIMAL(3, 1),
    language VARCHAR(50),
    duration INT,
    subtitle VARCHAR(50)
);


CREATE TABLE movie_details (
    movie_details_id SERIAL PRIMARY KEY,
    movie_id INT,
    movie_description TEXT,
    release_date DATE,
    cast TEXT,
    rating DECIMAL(3, 1),
    language VARCHAR(50),
    duration INT,
    subtitle VARCHAR(50)
);


CREATE TABLE Address (
    AddressID INT PRIMARY KEY,
    CityName VARCHAR(100),
    ZipCode VARCHAR(10),
    State VARCHAR(50)
);

CREATE TABLE Cinema (
    CinemaID INT PRIMARY KEY,
    Name VARCHAR(100),
    AddressID INT,
    FOREIGN KEY (AddressID) REFERENCES Address(AddressID)
);

CREATE TABLE ShowTime (
    ShowTimeID INT PRIMARY KEY,
    MovieID INT,
    ScreenID INT,
    CinemaID INT,
    StartTime TIME,
    ShowDate DATE,
    FOREIGN KEY (MovieID) REFERENCES Movie(MovieID),
    FOREIGN KEY (ScreenID) REFERENCES Screen(ScreenID),
    FOREIGN KEY (CinemaID) REFERENCES Cinema(CinemaID)
);


CREATE TABLE Seats (
    SeatID INT PRIMARY KEY,
    SeatNo VARCHAR(10),
    RowNumber INT,
    SeatType VARCHAR(20),
    ScreenID INT,
    FOREIGN KEY (ScreenID) REFERENCES Screen(ScreenID)
);

CREATE TABLE Ticket (
    TicketID INT PRIMARY KEY,
    UserID INT,
    ShowTimeID INT,
    VoucherID INT,
    PaymentID INT,
    TotalPrice DECIMAL(10, 2),
    TicketDate DATE,
    FOREIGN KEY (UserID) REFERENCES User(UserID),
    FOREIGN KEY (ShowTimeID) REFERENCES ShowTime(ShowTimeID),
    FOREIGN KEY (VoucherID) REFERENCES Voucher(VoucherID),
    FOREIGN KEY (PaymentID) REFERENCES Payment(PaymentID)
);

