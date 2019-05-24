class ProductsController < ApplicationController


  def index
    @products = Product.all

  end

  def new
    @products = Product.new
  end

  def create
    @products = Product.new(product_params)
    if @products.save  
      redirect_to(products_path)
    else
      render('new')
      
    end
  end

  def show
    @products = Product.find(params[:id])

  end

  def edit
    @products = Product.find(params[:id])

  end

  def update
    @products = Product.find(params[:id])
  if @products.update_attributes(product_params)
    redirect_to(products_path(@products))
  else
    render ('edit')
  end

  end

  def delete
    
  end

  def destroy
    @products = Product.find(params[:id])
    @products.destroy
    redirect_to(products_path)

  end

  private
  def product_params
    params.required(:product).permit(:title,:description,:product_image,:price)
  end
end
