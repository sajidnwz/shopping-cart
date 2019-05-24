class AddProductImageToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :product_image, :string
  end
end
