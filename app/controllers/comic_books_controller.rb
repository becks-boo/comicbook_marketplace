class ComicBooksController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show ]

  def index
    @comic_books = policy_scope(ComicBook)
  end

  def new
    @comic_book = ComicBook.new
  end

  # def create
  #   @comic_book = ComicBook.new

  # end

  def show
    @comic_book = ComicBook.find(params[:id])
    authorize @comic_book
  end

end
