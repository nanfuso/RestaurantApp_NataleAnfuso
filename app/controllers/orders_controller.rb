class OrdersController < ApplicationController
    before_action :authenticate_user!

    def create
        carted_products = current_user.cart
        order = Order.new(
                            user_id: current_user.id,
                            tip: params[:tip]
                            )
        order.save
        carted_products.update_all(
                                    status: "purchased",
                                    order_id: order.id,
                                    )
        order.calculate_totals
        redirect_to "/orders/#{order.id}"
    end

    def show
        @order = Order.find(params[:id])
        unless current_user.id && @order.user_id == @order.user.id
            redirect_to '/'
        end
    end
end
