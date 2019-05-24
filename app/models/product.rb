class Product < ApplicationRecord

	has_many :line_items, :dependent => :destroy

	validates :title, :description, :presence => true
	validates :price, :numericality => {:greater_than_or_equal_to => 0.01}
	validates :title, :uniqueness => true
	mount_uploader :product_image, AvatarUploader

	# validates :image_url, :format => {

	# 	:with => %r{\.(gif|jpg|png)}i,
	# 	:message => 'must be a url for GIF,JPG,PNG image'
	# }

	before_destroy :ensure_not_referrenced_by_any_line_item

	def ensure_not_referrenced_by_any_line_item
		if line_items.count.zero?
			return true
		else
			errors[:base] << "line items present"
			return false
		end
	end
end
