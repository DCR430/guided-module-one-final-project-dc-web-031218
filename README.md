# Module One Project -- Flatiron BnB 

This is our project for the first module of the Flatiron School Immersive. 03/30/2018. 
Materials covered in Module 1 include OO Ruby, SQL, ORMs and ActiveRecord. 

In this project, we made a command line interface for searching for and reserving stays via an Airbnb-inspired domain. 
We built User, Reservation, Listing, and Query classes from scratch. 

Users have many queries, a query has one user. User has many listings through reservations and has many reservations. Reservations belong to a listing and a user. Listings has many users through :reservations and has many reservations. 

User Stories: 
1) Users can search for listings in three different cities (NYC, LA, DC). 
2) Users can choose to look at listings amongst other choices
3) Users can choose listings based on prices
4) Users can save reservations

## How to install and run the program: 

1) Hop into the directory of the project via 'cd #{project name}' 
1) Install by running 'bundle install' in the CLI. 
2) Run the program by running 'ruby bin/run.rb' in CLI. 
3) Follow instructions, see listings, and make reservations. 

## Contributors Guide

If you would like to contribute to the project, then please fork and clone a copy, then submit a pull request to our project here. 

### Creative Commons Attibution 4.0 License (https://creativecommons.org/licenses/by/4.0/) 
