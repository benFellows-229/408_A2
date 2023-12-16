from ui import *


def main():
    conn = connect_db()
    ui(conn)
    close_db(conn)


if __name__ == "__main__":
    main()