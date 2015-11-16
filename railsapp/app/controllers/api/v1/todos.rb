module API
  module V1
    class Todos < Grape::API
      include API::V1::Defaults
      resource :todos do
        desc "Return list of todos"
        get do
          Todo.all # obviously you never want to call #all here
        end
      end
    end
  end
end
