class GadgetsController < ApplicationController

	before_filter :authenticate_user!
	before_action :get_gadget, only: [:show, :edit, :update, :destroy, :upload]

	def index
		search = "%"+params[:search].to_s+"%"
		@gadgets = current_user.gadgets.where("name like ? or description like ?", search, search)#.page(params[:page],params[:search]).per(10)
	end

	def show
		@upload = GadgetImage.new
	end

	def new
		@gadget = Gadget.new
	end


	def create
		@gadget = Gadget.new(gadget_params)
		@gadget.user_id = current_user.id
		if @gadget.save
			redirect_to @gadget
		else
			render new_gadget_path
		end
	end

	def edit
	end

	def update
		if @gadget.update_attributes(gadget_params)
			redirect_to @gadget
		else
			render edit_gadget_path(@gadget)
		end
	end


	def destroy
		@gadget.destroy if !@gadget.nil?
		redirect_to :index
	end

	def upload
		if params[:gadget_image].blank?
			flash[:notice] = "Please select a file"
			@upload = GadgetImage.new
		else
			@upload = GadgetImage.new(params[:gadget_image].permit(:image))
			@upload.gadget_id = @gadget.id
			if @upload.save
				flash[:notice] = "Successfully uploaded"
			else
				flash[:notice] = "Error on upload"
			end
		end
		render :show
	end


private
	def gadget_params
		params.require(:gadget).permin(:name,:description)
	end

	def get_gadget
		@gadget = current_user.gadgets.find_by_id(params[:id].to_i)
	end


end
