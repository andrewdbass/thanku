class PeopleController < ApplicationController
	def index
		@people = Person.all
	end
	def new
		@person = Person.new
	end
	def create
		@person = Person.new(person_params)
		if @person.save 
			redirect_to people_path
		else
			render :new
		end
	end
	def show
		@person = Person.find(params[:id])
	end
	def edit
		@person = Person.find(params[:id])
	end
	def update
		@person = Person.find(params[:id])
		@person.update(person_params)
		if @person.save 
			redirect_to people_path
		else
			render :edit
		end
	end
	def destroy
		@person = Person.find(params[:id])
		@person.delete

		redirect_to people_path	
	end

	private
	def person_params
		params.require(:person).permit(:name, :bio, :link, :image, :user_id)
	end
end
