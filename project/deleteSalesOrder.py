import mysql.connector

def delete_sales_orders_and_picklist():
    conn = None # Initialize conn to None
    try:
        # Connect to the MySQL database
        conn = mysql.connector.connect(
            host="localhost",
            user="root", 
            password="admin123",
            database="datamile"
        )
        
        cursor = conn.cursor()
        print("Connected to MySQL")
        
        # List of tables to delete data from
        tables = [
            'sales_order', 
            'picklist', 
            'cancelled_list', 
            'weekly_forecasts', 
            'weekly_totals', 
            'monthly_forecasts', 
            'monthly_totals', 
            'grand_total'
        ]

        # Delete all rows from each table
        for table in tables:
            delete_query = f"DELETE FROM {table}"
            cursor.execute(delete_query)
            conn.commit()
            print(f"All rows deleted from the '{table}' table")

        cursor.close()
        
        cursor.close()
        
    except mysql.connector.Error as error:
        print("Failed to delete rows from the tables:", error)
        
    finally:
        if conn:
            conn.close()
            print("MySQL connection closed")

if __name__ == '__main__':
    delete_sales_orders_and_picklist()


    