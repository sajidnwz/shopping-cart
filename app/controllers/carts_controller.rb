class CartsController < ApplicationController
  
  	def index
  	
  	end

  	def new
  	end

  	def show
  		begin
  			@cart = Cart.find(params[:id])
  		rescue ActiveRecord::RecordNotFound
  			logger.error "attempt to access invalid cart #{params[:id]}"
  			redirect_to store_path, notice: 'invalid cart'
		end
  	end

	def edit
  	end

  	def destroy
  			@cart = Cart.find(params[:id])
  		if @cart.destroy
  			redirect_to store_path, notice: "Your cart have been deleted"

  		end
	end
end
