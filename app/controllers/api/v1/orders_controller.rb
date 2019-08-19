module Api
    module V1
        class Orders < ApplicationController
            def index
                if params[:customer:id]
                    @orders = Order.where(customer_id: params[:customer_id])
                else
                @orders = Order.all 
                end
                render json: @orders
            end

            def show 
                @order = Order.find(params[:id])
                render json:@order
            end

            def create
                @order = Order.new(customer_id: params[:customer_id])
                @order[:status] = 'pending'
                @order.save!
                render json: @order
            end

            def ship
                @order = Order.find(params[:id])
                @order[:status] = "shipped"
                render json: @order
            end

            private
            def order_params
                params.require(:customer_id)
            end
        end
    end
end
