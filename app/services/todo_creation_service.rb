# typed: true

class TodoCreationService
  extend T::Sig

  class TodoParams < T::Struct
    const :title, String
    const :completed, T::Boolean
  end

  sig { params(params: TodoParams).returns(Todo) }
  def call(params)
    Todo.create!(title: params.title, completed: params.completed)
  end
end
