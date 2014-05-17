class GadgetImage < ActiveRecord::Base

	belongs_to :gadget
	mount_uploader :image, AppliftUploader

end
