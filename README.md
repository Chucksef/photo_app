# Dynamic Portfoio 1.1
    Project: Dynamic Portfolio 1.1
    Author: Chuck Crouse
    Build Date: 05/15/2020
    Build Version: v1.1.0
    Host: Heroku
    Framework: Ruby on Rails


## Purpose
Dynamic Portfolio 1.0 is my own personal portfolio. I built it to host my own content and show off the cool projects I've built over the last several years. The thing that sets it apart from other basic portfolio sites is that I built it to accept new content dynamically via an admin interface invisible to normal site visitors.

## Features
* Entire Website Stored as a Database for Easy Editing
* No Need to Ever Re-Code Individual Pages When Adding Content
* Page Templates available:
   * Splash/Landing Page
   * Article Page
   * Cards Page
   * Gallery Page
* Add, Re-Order, Group, and Delete Pages as Needed
* Add and Delete Page Content on the Fly, Including Adding Images and Article Blocks to Most Page Types
* Images Securely Stored on Amazon S3
* Sign Up/Sign In Functionality Complete with "Remember Me" Option
* Sign-Up Page Hidden, but Accessible from <a href="https://www.chucksef.com/signup">Signup</a>
* Confirmation Email System (currently disabled)
* Forgot Password Functionality
* Modern Security/Authentication

 ## Future Plans
* Processesing of Uploaded Images for quicker loading from S3
* Add More Content Types:
   * List
   * Contact
   * More Image/Text variations
   * Image alone
   * Links
   * Headings
   * Separators
   * Embedded Videos

## TODO
* Custom JS on splash page
* Deleting a Group should un-group all of its members
* Deleting any page should re-order the remaining pages
* Implement Dark Mode
* Integrate Inline-SVG-S3 gem