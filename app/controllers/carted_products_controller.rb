class CartedProductsController < ApplicationController
    before_action :authenticate_user! 
    
    def index
        if current_user && current_user.cart.any?
            @carted_products = current_user.cart
        else
            flash[:warning] = "Add something to your cart!"
            redirect_to '/'
        end
    end

    def create
        @item = Item.find(params[:item_id])
        carted_products = CartedProduct.new(
                                quantity: params[:quantity],
                                user_id: current_user.id,
                                item_id: params[:item_id],
                                status: "carted"
                                 )
        carted_products.save
        flash[:success] = "Item Added to Cart"
        redirect_to '/'
    end

    def destroy
        carted_product = CartedProduct.find(params[:id])
        carted_product.update(status: "removed")
        flash[:success] = "Item Removed from Cart"
        redirect_to '/carted_products'
    end

end
