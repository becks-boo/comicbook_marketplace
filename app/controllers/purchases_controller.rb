class PurchasesController < ApplicationController
  def show
    @purchase = Purchase.find(params[:id])

    authorize @purchase
  end
end
