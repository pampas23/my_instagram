class PicsController < ApplicationController
	before_action :find_pic, :only=>[:show, :update, :edit, :destroy, :like]
	before_action :authenticate_user!, except: [:index, :show]

	def index
		@pics = Pic.all.order("created_at DESC")
	end

	def new
		@pic = current_user.pics.build
	end

	def create
		@pic = current_user.pics.build(pic_params)

		if @pic.save
			redirect_to @pic
		else
			render new
		end

	end

	def edit
		
	end

	def update
		if @pic.update(pic_params)
			redirect_to @pic
		else
			render 'edit'
		end
	end

	def destroy
		@pic.destroy
		redirect_to pics_path
	end

	def like
		@pic.like_by_user(current_user)
		redirect_to @pic
	end

	private

	def pic_params
		params.require(:pic).permit(:user_id, :tittle, :description,:image)
	end

	def find_pic
		@pic = Pic.find(params[:id])
	end

end
