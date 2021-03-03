class TodosController < ApplicationController

	def new
		@todo = Todo.new
	end

	def create
		@todo = Todo.new(todo_params)
		if @todo.save
			flash[:notice]= "Todo is Created Successfully"
			redirect_to todo_path(@todo)
		else
			render 'new'
		end
	end

	
	def show
		@todo = Todo.find(params[:id])
	end

	private
		def todo_params
			params.require(:todo).permit(:name , :discription)
		end

	
	def delete
		
	end

end