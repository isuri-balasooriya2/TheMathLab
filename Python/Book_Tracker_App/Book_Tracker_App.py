import json
from operator import truediv

books = []

def add_new_book(title,author,pages,read_status):
    book = {"Title":title,"Author":author,"Pages":pages,"ReadStatus":read_status}
    books.append(book)
    print(f"{title} Added Successfully")

def view_all_books():
    if not books:
        print("There are no books in the Tracker")
        return
    for i, book in enumerate(books,1):
        read_status = "✅ Read" if book["ReadStatus"] else "❌ Not Read"
        print(f"{i}.{book["Title"]} by {book["Author"]} with {book["Pages"]} pages. - {read_status}")

def mark_read(title):
    for book in books:
        if book["Title"].lower()==title.lower():
            book["ReadStatus"] = True
            print(f"{title} has been marked as read")
            return
    print(f"{title} not found")

def save_date():
    with open("books.json","w") as file:
        json.dump(books,file)
    print("Data saved successfully")

def load_data():
    global books
    try:
        with open("books.json", "r") as file:
            books = json.load(file)
        print("Books loaded successfully!")
    except FileNotFoundError:
        print("No saved books found.")

def menu():
    load_data()

    while True:
        print("\n📚 Book Tracker Menu 📚")
        print("1. Add a Book")
        print("2. View Books")
        print("3. Mark a Book as Read")
        print("4. Save & Exit")

        choice = input("Enter your choice: ")

        if choice=="1":
            title= input("Enter the title: ")
            author=input("Enter the author name: ")
            pages = input("Enter the number of pages: ")
            read_status = input("Have you read this book (yes/no): ").lower()=="yes"
            add_new_book(title,author,pages,read_status)

        elif choice=="2":
            view_all_books()

        elif choice=="3":
            book= input("Which title do you want to mark as read? ")
            mark_read(book)

        elif choice=="4":
            save_date()
            print("Good Bye")
            break

        else:
            print("Invalid choice. Try again")

menu()