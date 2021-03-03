class TodosController < ApplicationController

	def new
		@todo = Todo.new
	end

	def index
		@todos = Todo.all
		
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

	
	def edit
		@todo = Todo.find(params[:id])
	end

	def update
		@todo = Todo.find(params[:id])
		if @todo.update(todo_params)
			flash[:notice]= "Todo is Update Successfully"
			redirect_to todo_path(@todo)
		else
			render 'edit'
		end
	end
	
	def show
		@todo = Todo.find(params[:id])
	end

	private
		def todo_params
			params.require(:todo).permit(:name , :discription)
		end


end