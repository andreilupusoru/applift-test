class GadgetsController < ApplicationController

	before_filter :authenticate_user!

	def index
		search = "%"+params[:search].to_s+"%"
		@gadgets = current_user.gadgets.where("name like ? or description like ?", search, search)#.page(params[:page],params[:search]).per(10)
	end

	def show
		@gadget = current_user.gadgets.find_by_id(params[:id].to_i)
		@upload = GadgetImage.new(:gadget_id=>@gadget_id)
	end

	def new
		@gadget = Gadget.new
	end


	def create
		@gadget = Gadget.new(params[:gadget].permit(:name, :description))
		@gadget.user_id = current_user.id
		if @gadget.save
			redirect_to @gadget
		else
			render new_gadget_path
		end
	end

	def edit
		@gadget = current_user.gadgets.find_by_id(params[:id].to_i)
	end

	def update
		@gadget = current_user.gadgets.find_by_id(params[:id].to_i)
		if @gadget.update_attributes(params[:gadget].permit(:name, :description))
			redirect_to @gadget
		else
			render edit_gadget_path(@gadget)
		end
	end


	def destroy
		@gadget = current_user.gadgets.find_by_id(params[:id].to_i)
		@gadget.destroy if !@gadget.nil?
		redirect_to :index
	end

	def upload
		@gadget = current_user.gadgets.find_by_id(params[:id].to_i)
		@upload = GadgetImage.new(params[:gadget_image].permit(:image))
		if @upload.image.filename.nil?
			flash[:notice] = "Please select a file"
		else
			if @upload.save
				flash[:notice] = "Successfully uploaded"
			else
				flash[:notice] = "Error on upload"
			end
		end
		render :show
	end


end
