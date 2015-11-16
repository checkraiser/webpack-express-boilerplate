module API
  module V1
    class Todos < Grape::API
      include API::V1::Defaults
      resource :todos do
        desc "Return list of todos"
        get do
          Todo.all # obviously you never want to call #all here
        end

        desc "Create new todo"
        params do
          requires :content, type: String, desc: "Content of todo"
        end
        post do
          todo = Todo.create(content: params[:content])
          Todo.all
        end
      end
    end
  end
end
