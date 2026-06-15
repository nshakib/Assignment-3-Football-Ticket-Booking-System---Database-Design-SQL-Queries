-- =========================================================================
-- SYSTEM: Football Ticket Booking System Database Setup Template
-- DESCRIPTION: Pseudo-DDL Template for Table Creation & Data Insertion
-- INSTRUCTIONS: Replace 'TYPE' and the constraint placeholders with your own
--               actual data types, relational keys, and check criteria.
-- =========================================================================

-- DROP TABLES IF THEY ALREADY EXIST TO PREVENT CONFLICTS
DROP TABLE IF EXISTS Bookings;
DROP TABLE IF EXISTS Matches;
DROP TABLE IF EXISTS Users;

-- =========================================================================
-- 1. CREATE USERS TABLE
-- =========================================================================
CREATE TABLE Users (
    user_id serial primary key,
    full_name varchar(50),
    email varchar(30) unique,
    role varchar(30) check (role in('Ticket Manager', 'Football Fan')),
    phone_number varchar(15)
    
    -- Write your constraint to make 'user_id' the Primary Key
    -- Write your constraint to ensure 'email' values are never duplicated
    -- Write your check constraint to restrict 'role' to specific allowed strings
);

-- =========================================================================
-- 2. CREATE MATCHES TABLE
-- =========================================================================
CREATE TABLE Matches (
    match_id serial primary key,
    fixture varchar(100),
    tournament_category varchar(50),
    base_ticket_price numeric(8,2) check(base_ticket_price > 0),
    match_status varchar(50) check(match_status in ('Available', 'Selling Fast', 'Sold Out', 'Postponed'))
    
    -- Write your constraint to make 'match_id' the Primary Key
    -- Write your check constraint to prevent negative ticket prices
    -- Write your check constraint to restrict 'match_status' values
);

-- =========================================================================
-- 3. CREATE BOOKINGS TABLE
-- =========================================================================
CREATE TABLE Bookings (
    booking_id serial  primary key,
    user_id integer references users(user_id),
    match_id integer references matches(match_id),
    seat_number varchar(30),
    payment_status varchar(30) check(payment_status in ('Pending', 'Confirmed', 'Cancelled', 'Refunded')),
    total_cost numeric(8,2) check(total_cost > 0)
    
    -- Write your constraint to make 'booking_id' the Primary Key
    -- Write your Foreign Key constraint linking 'user_id' to the Users table
    -- Write your Foreign Key constraint linking 'match_id' to the Matches table
    -- Write your check constraint to ensure 'total_cost' is non-negative
    -- Write your check constraint to restrict 'payment_status' values
);
