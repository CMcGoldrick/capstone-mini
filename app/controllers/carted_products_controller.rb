class CartedProductsController < ApplicationController
  def index
    # @carted_products = CartedProduct.where(status: "carted", user_id: current_user.id)
    @carted_products = current_user.carted_products.where(status: "carted")

    render 'index.json.jbuilder'
  end

  def create
    @carted_product = CartedProduct.new(
                                        user_id: current_user.id
                                        #you get current user from KNOCK
                                        product_id: params[:product_id],
                                        quantity: params[:quantity],
                                        status: "carted")

    @carted_product.save
    render 'show.json.jbuilder'
  end
end

