

import mysql.connector


def connect_db():
    try:
        conn = mysql.connector.connect(
            host='localhost',
            port='3306',
            user='root',
            password='change-me',
            database='A2'
        )
        return conn
    except mysql.connector.Error as e:
        print("Failed to connect to MySQL table {}".format(e))


def close_db(conn):
    conn.close()







