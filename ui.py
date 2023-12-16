# Basic test ui with error handling and input validation nested into functions

from db import *
import re

def ui(conn):
    menu_choice_pattern = r"^[1-6]$"

    while True:
        print("1. List all products that are out of stock")
        print("2. Find the total number of orders placed by each customer")
        print("3. Display the details of the most expensive product ordered in each order")
        print("4. Retrieve a list of products that have never been ordered")
        print("5. Show the total revenue (price * quantity) generated by each supplier")
        print("6. Exit")
        choice = input("Enter your choice: ")

        if re.match(menu_choice_pattern, choice):
            choice = int(choice)
            if choice == 1:
                list_all_products(conn)
            elif choice == 2:
                find_total_orders(conn)
            elif choice == 3:
                display_details(conn)
            elif choice == 4:
                list_products(conn)
            elif choice == 5:
                show_revenue(conn)
            elif choice == 6:
                break
        else:
            print('\nPlease enter a number 1-6 to select your option\n')


def list_all_products(conn):
    try:
        cursor = conn.cursor()
        query = "SELECT ProductName FROM Products WHERE UnitsInStock = 0;"
        cursor.execute(query)
        print()
        for row in cursor:
            print(row)
        print()
    except mysql.connector.Error as e:
        print("Failed to list all products {}".format(e))


def find_total_orders(conn):
    try:
        cursor = conn.cursor()
        query = """SELECT Customers.CustomerName, COUNT(Orders.OrderID) AS TotalOrders
                FROM Customers
                JOIN Orders ON Customers.CustomerID = Orders.CustomerID
                GROUP BY Customers.CustomerName;
                """
        cursor.execute(query)
        print()
        for row in cursor:
            print(row)
        print()
    except mysql.connector.Error as e:
        print("Failed to find total orders {}".format(e))


def display_details(conn):
    try:
        cursor = conn.cursor()
        query = """SELECT Orders.OrderID, Products.ProductName, OrderDetails.UnitPrice
                FROM OrderDetails
                JOIN Orders ON OrderDetails.OrderID = Orders.OrderID
                JOIN Products ON OrderDetails.ProductID = Products.ProductID
                WHERE (OrderDetails.OrderID, OrderDetails.UnitPrice) IN (
                    SELECT OrderID, MAX(UnitPrice)
                    FROM OrderDetails
                    GROUP BY OrderID
                );
                """
        cursor.execute(query)
        print()
        for row in cursor:
            print(row)
        print()
    except mysql.connector.Error as e:
        print("Failed to display details {}".format(e))


def list_products(conn):
    try:
        cursor = conn.cursor()
        query = """SELECT ProductName
                FROM Products
                WHERE ProductID NOT IN (
                    SELECT DISTINCT ProductID
                    FROM OrderDetails
                );
                """
        cursor.execute(query)
        print()
        for row in cursor:
            print(row)
        print()
    except mysql.connector.Error as e:
        print("Failed to list products {}".format(e))


def show_revenue(conn):
    try:
        cursor = conn.cursor()
        query = """SELECT Suppliers.SupplierName, SUM(OrderDetails.UnitPrice * OrderDetails.Quantity) AS TotalRevenue
                FROM Suppliers
                JOIN Products ON Suppliers.SupplierID = Products.SupplierID
                JOIN OrderDetails ON Products.ProductID = OrderDetails.ProductID
                GROUP BY Suppliers.SupplierName;
                """
        cursor.execute(query)
        print()
        for row in cursor:
            print(row)
        print()
    except mysql.connector.Error as e:
        print("Failed to show revenue {}".format(e))