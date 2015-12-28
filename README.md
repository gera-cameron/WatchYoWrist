
=============
# Watch-Yo-Wrist
a [Sails](http://sailsjs.org) application

## To run:
### Create database using mysql:
1. Install [MySQL](http://dev.mysql.com/downloads/mysql/).
2. Run `mysql -u root`
3. Create database using `create database onlinestore;` and switch to it with `use onlinestore`
4. Then use the following code found in Project.sql
    ```
    # order table
    CREATE TABLE AnOrder (
    	id INT NOT NULL AUTO_INCREMENT,
    	date_bought timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    	cur_product INT REFERENCES Product.id,
    	cur_user INT REFERENCES User.id,
    	paid BOOLEAN,
    	quantity INT,
    	createdAt timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    	updatedAt timestamp ON UPDATE CURRENT_TIMESTAMP,
    	PRIMARY KEY (id)
    );

    # product table
    CREATE TABLE Product (
    	id INT NOT NULL AUTO_INCREMENT,
    	name CHAR(20),
    	price REAL,
    	stock INT,
    	description CHAR(100),
    	active BOOLEAN,
    	supplier INT REFERENCES Supplier.id,
    	createdAt timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    	updatedAt timestamp ON UPDATE CURRENT_TIMESTAMP,
    	PRIMARY KEY (id)
    );

    # supplier table
    CREATE TABLE Supplier (
    	id INT NOT NULL AUTO_INCREMENT,
    	name CHAR(20),
    	createdAt timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    	updatedAt timestamp ON UPDATE CURRENT_TIMESTAMP,
    	PRIMARY KEY (id)
    );

    # user table
    CREATE TABLE User (
    	id INT NOT NULL AUTO_INCREMENT,
    	address CHAR(20),
    	name CHAR(20),
    	password CHAR(20),
    	email CHAR(40) UNIQUE,
    	is_staff BOOLEAN,
    	createdAt timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    	updatedAt timestamp ON UPDATE CURRENT_TIMESTAMP,
    	PRIMARY KEY (id)
    );
    ```
5. Set up auto-increment for id:
    ```
    ALTER TABLE AnOrder AUTO_INCREMENT = 10000;
    ALTER TABLE Product AUTO_INCREMENT = 20000;
    ALTER TABLE Supplier AUTO_INCREMENT = 30000;
    ALTER TABLE User AUTO_INCREMENT = 40000;
    ```
6. Now add some test information:
    ```
    # contains orders placed
    INSERT INTO AnOrder (cur_product, cur_user, paid, quantity) VALUES (20000, 40000, TRUE, 1);
    INSERT INTO AnOrder (cur_product, cur_user, paid, quantity) VALUES (20003, 40001, TRUE, 4);
    INSERT INTO AnOrder (cur_product, cur_user, paid, quantity) VALUES (20007, 40002, TRUE, 2);
    INSERT INTO AnOrder (cur_product, cur_user, paid, quantity) VALUES (20010, 40003, TRUE, 3);

    # contains all products offered
    INSERT INTO Product (name, price, stock, description, active, supplier) VALUES ('Basic 1', 5.00, 100, 'This is a 1 month subscription to our basic model of watch bands. This supplier is Apple.', TRUE, 30000);
    INSERT INTO Product (name, price, stock, description, active, supplier) VALUES ('Basic 2', 14.00, 100, 'This is a 3 month subscription to our basic model of watch bands. This supplier is Apple.', TRUE, 30000);
    INSERT INTO Product (name, price, stock, description, active, supplier) VALUES ('Basic 3', 28.00, 100, 'This is a 6 month subscription to our basic model of watch bands. This supplier is Apple.', TRUE, 30000);
    INSERT INTO Product (name, price, stock, description, active, supplier) VALUES ('Basic 4', 55.00, 100, 'This is a 12 month subscription to our basic model of watch bands. This supplier is Apple.', TRUE, 30000);
    INSERT INTO Product (name, price, stock, description, active, supplier) VALUES ('Silver 1', 10.00, 50, 'This is a 1 month subscription to our silver model of watch bands. This supplier is Fossil.', TRUE, 30001);
    INSERT INTO Product (name, price, stock, description, active, supplier) VALUES ('Silver 2', 28.00, 50, 'This is a 3 month subscription to our silver model of watch bands. This supplier is Fossil.', TRUE, 30001);
    INSERT INTO Product (name, price, stock, description, active, supplier) VALUES ('Silver 3', 50.00, 50, 'This is a 6 month subscription to our silver model of watch bands. This supplier is Fossil.', TRUE, 30001);
    INSERT INTO Product (name, price, stock, description, active, supplier) VALUES ('Silver 4', 99.00, 50, 'This is a 12 month subscription to our silver model of watch bands. This supplier is Fossil.', TRUE, 30001);
    INSERT INTO Product (name, price, stock, description, active, supplier) VALUES ('Gold 1', 20.00, 25, 'This is a 1 month subscription to our gold model of watch bands. This supplier is Samsung.', TRUE, 30002);
    INSERT INTO Product (name, price, stock, description, active, supplier) VALUES ('Gold 2', 58.00, 25, 'This is a 3 month subscription to our gold model of watch bands. This supplier is Samsung.', TRUE, 30002);
    INSERT INTO Product (name, price, stock, description, active, supplier) VALUES ('Gold 3', 110.00, 25, 'This is a 6 month subscription to our gold model of watch bands. This supplier is Samsung.', TRUE, 30002);
    INSERT INTO Product (name, price, stock, description, active, supplier) VALUES ('Gold 4', 210.00, 25, 'This is a 12 month subscription to our gold model of watch bands. This supplier is Samsung.', TRUE, 30002);

    # contains all suppliers
    INSERT INTO Supplier (name) VALUES ('Apple');
    INSERT INTO Supplier (name) VALUES ('Samsung');
    INSERT INTO Supplier (name) VALUES ('Fossil');

    # contains all user information
    INSERT INTO User (address, name, password, email, is_staff) VALUES ('123 Main St', 'Kyle Brost', 'mypassword', 'broskj@email.com', TRUE);
    INSERT INTO User (address, name, password, email, is_staff) VALUES ('456 1st Ave', 'Cameron Gera', 'hispassword', 'gerac@email.com', TRUE);
    INSERT INTO User (address, name, password, email, is_staff) VALUES ('789 2nd Ln', 'John Doe', 'johndoe123', 'doejohn@email.com', FALSE);
    INSERT INTO User (address, name, password, email, is_staff) VALUES ('234 3rd Ave', 'Jane Doe', 'password123', 'doejane@email.com', FALSE);
    INSERT INTO User (address, name, password, email, is_staff) VALUES ('567 4th St', 'George Washington', 'washington456', 'gwash@email.com', FALSE);
    INSERT INTO User (address, name, password, email, is_staff) VALUES ('953 9th Rd', 'Teddy Roosevelt', 'teddyteddy2', 'teddyr@email.com', FALSE);
    ```
7. Add the following triggers to update the information:
    ```
    /*
    	prevent negative quantity
    	prevent quantity > stock
    	prevent ordering inactive product (stock = 0)
    */


    DELIMITER //

    CREATE TRIGGER beforeNewOrder
    BEFORE INSERT ON AnOrder
    FOR EACH ROW BEGIN
    	IF(NEW.quantity) <= 0 THEN SIGNAL SQLSTATE '22003' SET message_text = "ERROR: INVALID QUANTITY";
    	END IF;
    	IF(NEW.quantity) > (
    		SELECT stock
    		FROM Product
    		WHERE NEW.cur_product = id
    	) THEN
    		SIGNAL SQLSTATE '22003' SET message_text = "ERROR: QUANTITY > STOCK";
    	END IF;
    	IF (SELECT active
    		FROM Product
    		WHERE NEW.cur_product = id) = FALSE
    		THEN
    			SIGNAL SQLSTATE '22000' SET message_text = "ERROR: INACTIVE PRODUCT";
    	END IF;
    END;
    //

    /*
    	decrease stock by quantity on order
    	change active to false on stock = 0
    */

    CREATE TRIGGER onNewOrder
    AFTER INSERT ON AnOrder
    FOR EACH ROW BEGIN
    	UPDATE Product
    	SET stock = stock - NEW.quantity
    	WHERE NEW.cur_product = id
    	AND active = TRUE;
    	UPDATE Product
    	SET active = FALSE
    	WHERE stock = 0 AND active = TRUE;
    END;
    //

    CREATE TRIGGER beforeUpdateOrder
    BEFORE UPDATE ON AnOrder
    FOR EACH ROW BEGIN
    	IF(NEW.quantity) <= 0 THEN
    		SIGNAL SQLSTATE '22003' SET message_text = "ERROR: INVALID QUANTITY";
    	END IF;
    	IF(NEW.quantity) > (
    		SELECT stock
    		FROM Product
    		WHERE NEW.cur_product = id
    	) THEN
    		SIGNAL SQLSTATE '22003' SET message_text = "ERROR: QUANTITY > STOCK";
    	END IF;
    	IF (SELECT active
    		FROM Product
    		WHERE NEW.cur_product = id) = FALSE
    		THEN
    			SIGNAL SQLSTATE '22000' SET message_text = "ERROR: INACTIVE PRODUCT";
    	END IF;
    END;
    //

    /*
    	decrease stock by quantity on order
    	change active to false on stock = 0
    */

    CREATE TRIGGER onUpdateOrder
    AFTER UPDATE ON AnOrder
    FOR EACH ROW BEGIN
    	UPDATE Product
    	SET stock = stock - NEW.quantity
    	WHERE NEW.cur_product = id
    	AND active = TRUE;
    	UPDATE Product
    	SET active = FALSE
    	WHERE stock = 0 AND active = TRUE;
    END;
    //
    ```
8. Change the delimiter to the semicolon with `DELIMITER ;`
### Run the sails online store application:
1. Being a sails application, sails must be installed along with sails-related components.  Visit [here](http://sailsjs.org/get-started) to learn more and to be able to launch the application yourself.
2. Clone git repository and change to that directory.
3. Then please run `npm install` to install all the dependencies.
4. Then from terminal change directories to /assets folder and `npm install -g bower`. Then run `bower install`.
5. Run `sails lift` and you have yourself an online store. Make an account and enjoy your new watch band subscription.

### Member Contributions:
###### Cameron Gera:
- Contributed to initial MySQL database, including:
  - initial tables, sample data
  - key relations
  - triggers
- Worked to connect front-end interface with database using models and controllers
- Wrote HTML to create interface components
- AngularJS programming to populate interface with database information
- Created JavaScript functions to add functionality to interface
- Wrote JS code to handle adding/removing/altering database entries
- Miscellaneous testing

###### Kyle Brost:
- Contributed to initial MySQL database, including:
  - initial tables, sample data
  - key relations
  - triggers
- Initial HTML template
  - navigation bar, background, bootstrap components
- Initial CSS stylesheet
- Wrote HTML to create interface components
- AngularJS programming to populate interface with database information
- Created JavaScript functions to add functionality to interface
- Miscellaneous testing

### Major Challenges
Generally, the MySQL portion was simple.  It took time initially to get the table structure set and to relate the tables together, but once they were correct they became easy to manage.  It took a bit of research to discover MySQL functions like timestamps and auto-increment for attributes that benefited from using them.

Both group members had some previous experience with web development, with Kyle's being more front-end oriented and Cameron's being more back-end.  Major challenges arose with linking the local database to the interface, but eventually we managed to create correct models and controllers so that they could interact with the interface.  AngularJS was used in many cases to populate interface items such as lists due to its simplicity, though there was an initial learning curve.

Ultimately, most of the challenges we faced were with connecting the interface components with the database - things like adding users and editing product information.

### Programming Practices
Both group members had prior experience with basic HTML, CSS, and JavaScript.  The initial HTML/CSS for the website came from Kyle's personal website.  Sails uses a Model View Controller(MVC) architecture, which Cameron had prior experience with.  After an initial learning curve, both group members became acquainted with AngularJS which aided in that MVC architecture.

### File structure:
- Database structure is in Project.sql
- Controllers for database querying are in api/controllers/
- Database models are in api/models/
- assets/js/app.js contains more controllers and querying as well as AngularJS functions
- templates/ contains the .html files for each page
- assets/styles/style.css is the main styling file for the website
- assets/index.html is the main page as viewed by a user; it contains a shell which is populated with other html files through ng-view.  It contains the <head> tag and the navigation bar.
- templates/ again contains each .html file for page views.  Each of these pages is linked to assets/js/app.js through ng-controller in the html.

### Usage:
###### Users:
- From the home page, a user is unable to add items to their cart.  They are able to register an account and view the product listing, and may search the products and sort them by price.
  - An info button can be clicked to see the product's description and price.
- Once a user registers, they are able to sign in and add items to their cart located in the navbar.  Items may be deleted, and by checking out an order is made containing the products in the cart.  The cart contains an order total.
  - Those products' stocks are decremented by the quantity.
  - Products with a stock of 0 are disabled, meaning they are unable to be added to a cart.
- A user is also able to navigate to a settings page through the navbar and edit any of their account information (name, address, etc.)

###### Staff:
- Staff members view pages differently than guests and non-staff.
- The main products page will show more information about the product through the info button than other users will
  - A product's stock is shown
  - A warning message shows when a product's stock is low, with a button to contact the supplier
  - Another warning message shows when a product has not been purchased within the last month, with a button to delete the product
- In addition, a field is shown below the product listing area to add products to the database
- Buttons are shows only to staff to edit a product's information and to delete a product
- A 'Manage Orders' button appears in the navbar for staff only
  - This page allows staff to view, edit, and delete orders from the database.
- Additionally, staff see the settings page differently
  - Staff members not only can update their own information, but they can view, edit, and delete information for any user within the database.  Users can even be made as staff.
