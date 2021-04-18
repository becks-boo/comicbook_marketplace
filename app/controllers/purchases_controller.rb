class PurchasesController < ApplicationController
  def show
    @purchase = Purchase.find(params[:id])
    @comic_book = ComicBook.find(@purchase.comic_book_id)

    authorize @purchase
  end
end
