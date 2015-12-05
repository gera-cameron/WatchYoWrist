
=============
# Watch-Yo-Wrist
## CIS4301 Project
a [Sails](http://sailsjs.org) application

### To run:
Being a sails application, sails must be installed along with sails-related components.  Visit [here](http://sailsjs.org/get-started) to learn more and to be able to launch the application yourself.

### File structure:
Database structure is in Project.sql
Controllers for database querying are in api/controllers/
Database models are in api/models/
assets/js/app.js contains more controllers and querying as well as angularjs functions
templates/ contains the .html files for each page
assets/styles/style.css is the main styling file for the website

assets/index.html is the main page as viewed by a user; it contains a shell which is populated with other html files through ng-view.  It contains the <head> tag and the navigation bar.
templates/ again contains each .html file for page views.  Each of these pages is linked to assets/js/app.js through ng-controller in the html.

### Usage:
from the home page, a user is unable to add items to their cart.  They are able to register an account and view the product listing, and may search the products and sort them by price.
    - An info button can be clicked to see the product's description and price.
Once a user registers, they are able to sign in and add items to their cart located in the navbar.  Items may be deleted, and by checking out an order is made containing the products in the cart.  The cart contains an order total.
    - Those products' stocks are decremented by the quantity.
    - Products with a stock of 0 are disabled, meaning they are unable to be added to a cart.
A user is also able to navigate to a settings page through the navbar and edit any of their account information (name, address, etc.)

Staff members view pages differently than guests and non-staff.
The main products page will show more information about the product through the info button than other users will
    - A product's stock is shown
    - A warning message shows when a product's stock is low, with a button to contact the supplier
    - Another warning message shows when a product has not been purchased within the last month, with a button to delete the product
In addition, a field is shown below the product listing area to add products to the database
Buttons are shows only to staff to edit a product's information and to delete a product
A 'Manage Orders' button appears in the navbar for staff onle
    - This page allows staff to view, edit, and delete orders from the database.
Additionally, staff see the settings page differently
    - Staff members not only can update their own information, but they can view, edit, and delete information for any user within the database.  Users can even be made as staff.