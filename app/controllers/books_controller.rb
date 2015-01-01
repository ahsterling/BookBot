class BooksController < ApplicationController

  def index
    @book = book_search
  end

  def new
    book_search
    redirect_to books_path
  end

  def book_search
    titles = ["cats", "dinosaurs", "dogs", "magic", "fantasy"]
    title = titles.sample
    books = HTTParty.get("https://www.googleapis.com/books/v1/volumes?q=#{title}&maxResults=40").parsed_response
    books['items'].sample
    # Book.create(title: book_info['volumeInfo']['title'],
    #             author: book_info['volumeInfo']['authors'][0],
    #             pub_date: book_info['volumeInfo']['publishedDate'],
    #             description: book_info['volumeInfo']['description'])
  end
end
