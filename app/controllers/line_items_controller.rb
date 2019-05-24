class LineItemsController < ApplicationController
  def index
  end

  def new
  end

  def create
  	@cart = current_cart

  	line_item = @cart.add_product(params["product_id"])
  	if line_item.save
      product = Product.find(params["product_id"])
  		redirect_to store_path(@cart.id), notice: "#{product.title} item successfully added"
  	else
  		redirect_to store_path, notice: "lineitem not saved"
  	end
  end

  def destroy
    @cart = current_cart
    @line_item = @cart.line_items.find(params[:id])
    if @line_item.destroy
      redirect_to store_path
    end
  
  end

  def show
  end

  def edit
  end
end
