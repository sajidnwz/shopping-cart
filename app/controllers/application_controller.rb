class ApplicationController < ActionController::Base

	protect_from_forgery prepend: true

	before_action :authenticate_user!

	private

	def current_cart
		Cart.find(session[:cart_id])
	rescue ActiveRecord::RecordNotFound
		cart = Cart.create
		session[:cart_id] = cart.id
		cart
	end

end
