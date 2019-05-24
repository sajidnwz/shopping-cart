class OrdersController < ApplicationController
  def index

    @orders = Order.order("created_at DESC")
    @order = @orders.paginate page: params[:page], per_page: 10
    


  end

  def edit

    @order = Order.find(params[:id])

  end

  def new
  	if current_cart.line_items.empty?
  		redirect_to store_path, notice: "your cart is empty"
  		return
  	end
  	@order = Order.new
  end

  def create

  	@order = Order.new(order_params) 
  	@order.add_line_items_from_cart(current_cart)
  	if @order.save
  		Cart.destroy(session[:cart_id])
  		session[:cart_id] = nil
  		redirect_to(orders_path, :notice => 'Thank you for your order.')
  	else
  		render 'new'
  	end
  end

  def show
  end

  def update
    @order = Order.find(params[:id])
    if @order.update_attributes(order_params)
      redirect_to orders_path
      
    end
    
  end

  def destroy

    @order = Order.find(params[:id])
    if @order.destroy
      redirect_to orders_path
    end
    
  end

  private

  def order_params
  	params.require(:order).permit(:name, :address, :email, :pay_type)
  	
  end
end
