class Gadget < ActiveRecord::Base
	belongs_to :user
	has_many :gadget_images
	validates :name, :presence=> true
	validates :user_id, :presence=> true
end
