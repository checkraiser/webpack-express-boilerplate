class HomeController < ApplicationController
  include Tokenable
  def index
  	@todos =ActiveModel::ArraySerializer.new(Todo.all, each_serializer: TodoSerializer)
  end

  def about

  end

end
