from fastapi import FastAPI
import mysql.connector

app = FastAPI()

@app.get("/books")
def get_books():
    db = mysql.connector.connect(
        host="localhost",
        user="root",
        password="0710654707",
        database="LibraryDB"
    )
    cursor = db.cursor(dictionary=True)
    cursor.execute("SELECT * FROM Books")
    result = cursor.fetchall()
    db.close()
    return result

if __name__ == "__main__":
    import uvicorn
    uvicorn.run(app, host="0.0.0.0", port=8001)


if __name__ == "__main__":
    try:
        import uvicorn
        uvicorn.run(app, host="0.0.0.0", port=8001, log_level="debug")
    except Exception as e:
        print(f"🔥 CRASH REASON: {e}")
        input("Press Enter to exit...")