class ComicBooksController < ApplicationController

  def index
    @comic_books = ComicBook.all
  end
end
