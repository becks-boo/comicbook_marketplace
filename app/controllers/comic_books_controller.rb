class ComicBooksController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_comic_book, only: [:show, :edit, :update, :destroy]

  def index
    if params[:search].blank?
      @comic_books = policy_scope(ComicBook)
    else
      @parameter = params[:search].downcase
      @comic_books = policy_scope(ComicBook).where("lower(name) LIKE :search", search: "%#{@parameter}%")
    end
  end

  def new
    @comic_book = ComicBook.new
    authorize @comic_book
  end

  def create
    @comic_book = ComicBook.new(comic_book_params)

    @comic_book.user = current_user
    authorize @comic_book

    if @comic_book.save
      redirect_to comic_book_path(@comic_book)
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @comic_book.update(comic_book_params)
      redirect_to @comic_book, notice: "Comic Book was succesfully updated."
    else
      render :edit
    end
  end

  def destroy
    @comic_book.destroy

    redirect_to comic_books_path
    # later it should redirect to dashboard
  end

  private

  def set_comic_book
    @comic_book = ComicBook.find(params[:id])
    authorize @comic_book
  end

  def comic_book_params
    params.require(:comic_book).permit(:series, :name, :issue, :release_date, :writer, :artist, :location, :quantity, :price, :condition, :description, pictures: [])
  end
end
