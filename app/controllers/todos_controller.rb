class TodosController < ApplicationController
	before_action :set_todo, only: [:show, :destroy, :edit, :update]


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

	def destroy
		@todo.destroy
		flash[:notice] = "Todo is Destroy Successfully"
		redirect_to todos_path
	end
	
	def edit
	end

	def update
		if @todo.update(todo_params)
			flash[:notice]= "Todo is Update Successfully"
			redirect_to todo_path(@todo)
		else
			render 'edit'
		end
	end
	
	def show
	end

	private
		def set_todo
		@todo = Todo.find(params[:id])
		end

		def todo_params
			params.require(:todo).permit(:name , :discription)
		end


end