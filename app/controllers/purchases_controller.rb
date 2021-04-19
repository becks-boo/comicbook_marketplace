class PurchasesController < ApplicationController
  def show
    @purchase = Purchase.find(params[:id])
    @comic_book = @purchase.comic_book

    authorize @purchase
  end

  def create
    @comic_book = ComicBook.find(params[:comic_book])

    @purchase = Purchase.new

    @purchase.user = current_user
    @purchase.comic_book = @comic_book
    @purchase.value = @comic_book.price

    authorize @purchase

    if @purchase.save
      redirect_to purchase_path(@purchase)
    else
      flash[:alert] = "Not possible to buy"
      render "comic_books/show"
    end
  end

  private

  def purchase_params
    params.require(:purchase).permit(:value)
  end
end
