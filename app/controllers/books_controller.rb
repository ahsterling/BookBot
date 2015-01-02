class BooksController < ApplicationController

  def index
    # @book = goodreads_search("nonfiction")
    @book = Book.last
  end

  def new
    if params['genre']
      book = goodreads_search(params['genre'])
    else
      book = goodreads_search("fiction")
    end
    Book.create(
      title: book.best_book.title,
      author: book.best_book.author.name,
      image_url: book.best_book.image_url,
      rating: book.average_rating
      )
    redirect_to books_path
  end

  def goodreads_search(genre)
    client = Goodreads::Client.new(api_key: ENV["GOODREADS_KEY"], api_secret: ENV["GOODREADS_SECRET"])
    search = client.search_books(genre, field: genre)
    search.results.work.sample

  end
end
