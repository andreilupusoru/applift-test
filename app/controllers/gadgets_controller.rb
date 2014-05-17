class GadgetsController < ApplicationController

	before_filter :authenticate_user!

	def index
		search = "%"+params[:search].to_s+"%"
		@gadgets = current_user.gadgets.where("name like ? or description like ?", search, search)#.page(params[:page],params[:search]).per(10)
	end

	def show
		@gadget = current_user.gadgets.find_by_id(params[:id].to_i)
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
			render :new
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
			render :edit
		end
	end


	def destroy
		@gadget = current_user.gadgets.find_by_id(params[:id].to_i)
		@gadget.destroy if !@gadget.nil?
		redirect_to :index
	end


end
