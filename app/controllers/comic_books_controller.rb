class ComicBooksController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show ]

  def index
    @comic_books = policy_scope(ComicBook)
  end

  def new
    @comic_book = ComicBook.new
    authorize @comic_book
  end

  def create
    @comic_book = ComicBook.new(comic_book_params)
    # Is it necessary to get current_user?
    @comic_book.user = current_user
    authorize @comic_book

    if @comic_book.save
      redirect_to comic_book_path(@comic_book)
    else
      render :new
    end
  end

  def show
    @comic_book = ComicBook.find(params[:id])
    authorize @comic_book
  end

  def edit
    @comic_book = ComicBook.find(params[:id])

    authorize @comic_book
  end

  def update
    @comic_book = ComicBook.find(params[:id])

    if @comic_book.update(comic_book_params)
      redirect_to @comic_book, notice: "Comic Book was succesfully updated."
    else
      render :edit
    end

    authorize @comic_book
  end

  def destroy
    @comic_book = ComicBook.find(params[:id])
    @comic_book.destroy

    redirect_to comic_books_path
    # later it should redirect to dashboard

    authorize @comic_book
  end

  private

  def comic_book_params
    params.require(:comic_book).permit(:series, :name, :issue, :release_date, :writer, :artist, :location, :quantity, :price, :condition, :description)
  end
end
