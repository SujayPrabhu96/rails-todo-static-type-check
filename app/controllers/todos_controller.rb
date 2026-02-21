# typed: true

class TodosController < ApplicationController
  skip_before_action :verify_authenticity_token

  extend T::Sig

  sig { void }
  def index
    @todos = Todo.all
    render json: @todos
  end

  sig { void }
  def create
    @todo = TodoCreationService.new.call(todo_params)
    render json: { id: @todo.id, title: @todo.title, completed: @todo.completed }
  end

  private
  sig { returns(TodoCreationService::TodoParams) }
  def todo_params
    TodoCreationService::TodoParams.new(
      title: params.require(:title),
      completed: params.require(:completed)
    )
  end
end
