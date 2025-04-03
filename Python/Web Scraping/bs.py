from bs4 import BeautifulSoup
import requests
import csv

url = "https://books.toscrape.com/"
response = requests.get(url)

#print(response.text) #raw html text

soup = BeautifulSoup(response.text,"html.parser")
#print(soup.prettify()) #formatted html

with open("books.csv", "w", newline="", encoding="utf-8") as file:
    writer = csv.writer(file)
    writer.writerow(["Title", "Price"])  # Column names
    books = soup.find_all("article", class_="product_pod")
    for book in books:
        title = book.h3.a["title"]
        price= book.find("p", class_="price_color").text
        writer.writerow([title, price])
        print(f"Book: {title}, Price: {price}")

print("Data saved successfully!")




