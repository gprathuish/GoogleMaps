class UsersController < ApplicationController
	before_action :set_user, only: [:edit, :show, :add_location]
	def index
		@users = User.all
		@user = User.new
		
	end

	def new		
	end

	def create
		user = User.new(user_params)
		if user.save
			redirect_to users_path
		else
			render 'index'
		end
	end

	def show
		@locations = @user.locations
		@location = Location.new


	end

	def edit
		
	end

	def update
		
	end

	def add_location
		@user.locations.create(params.require(:location).permit(:lat,:lng,:title,:description))
		flash[:alert] = "Successfully created..."
		redirect_to user_path(@user)		
	end

	def get_location
		# raise params.inspect
		@location = Location.find(params[:id])
		respond_to do |format|
			format.js			
		end
	end

	private
	def user_params
		params.require(:user).permit(:name)
	end

	def set_user
		@user = User.find(params[:id])
	end
end
