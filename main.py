from db import *
from ui import *

def main():
    conn = connect_db()
    ui(conn)

if __name__ == "__main__":
    main()