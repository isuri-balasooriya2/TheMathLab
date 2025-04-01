
class Books:

    def __init__(self,title,author,pages,read):
        self.title = title
        self.author= author
        self.pages = pages
        self.read = read

    def view_books(self):
        return f"📖 {self.title} by {self.author} ({self.pages}) - [{self.read}]"

    def update_status(self,new_status):
        self.read = new_status

class BookTracker:
    def __init__(self):
        self.books = []

    def add_book(self, book):
        self.books.append(book)
        print(f"✅ Added: {book.title}")

    def view_books(self):
        if not self.books:
            print("📚 No books in the tracker.")
        else:
            for idx, book in enumerate(self.books, start=1):
                print(f"{idx}. {book.view_books()}")

    def search_book(self, title):
        for book in self.books:
            if book.title.lower() == title.lower():
                print(f"🔍 Found: {book.view_books()}")
                return book
        print("❌ Book not found.")
        return None

    def update_book_status(self, title, new_status):
        book = self.search_book(title)
        if book:
            book.update_status(new_status)
            print(f"📌 Status Updated: {book.view_books()}")

    def remove_book(self, title):
        for book in self.books:
            if book.title.lower() == title.lower():
                self.books.remove(book)
                print(f"🗑️ Removed: {title}")
                return
        print("❌ Book not found.")

# Create a book tracker instance
tracker = BookTracker()

# Add books
tracker.add_book(Books("The Hobbit", "J.R.R. Tolkien", 500,"Read"))
tracker.add_book(Books("1984", "George Orwell", 250, "Read"))

# View all books
#tracker.view_books()

# Search for a book
tracker.search_book("1984")

# Update reading status
tracker.update_book_status("The Hobbit", "In Progress")

# Remove a book
tracker.remove_book("1984")

# View books after removal
tracker.view_books()

