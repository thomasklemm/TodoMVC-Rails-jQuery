class TodosController < ApplicationController
  before_action :set_context, only: [:toggle_all, :clear_completed]
  before_action :set_todos, only: [:index, :toggle_all, :clear_completed]
  before_action :set_todo, only: [:edit, :update, :destroy]
  respond_to :html, only: :index
  respond_to :js

  def index
    respond_with @todos
  end

  def new
    @todo = Todo.new
    respond_with @todo
  end

  def create
    @todo = Todo.new(todo_params)
    flash[:notice] = 'Todo was successfully created.' if @todo.save
    respond_with @todo
  end

  def edit
    respond_with @todo
  end

  def update
    flash[:notice] = 'Todo was successfully updated.' if @todo.update(todo_params)
    respond_with @todo
  end

  def destroy
    flash[:notice] = 'Todo was successfully destroyed.' if @todo.destroy
    respond_with @todo
  end

  def toggle_all
    Todo.toggle_all
    respond_with @todos
  end

  def clear_completed
    Todo.clear_completed
    respond_with @todos
  end

  private

  def set_context
    path = request.referer
    return unless path.present?
    params[:active] = true if path.end_with?(active_todos_path)
    params[:completed] = true if path.end_with?(active_todos_path)
  end

  def set_todos
    @todos = case
             when params[:active] then Todo.active
             when params[:completed] then Todo.completed
             else Todo.all
             end
  end

  def set_todo
    @todo = Todo.find(params[:id])
  end

  def todo_params
    params.require(:todo).permit(:title, :completed)
  end
end

