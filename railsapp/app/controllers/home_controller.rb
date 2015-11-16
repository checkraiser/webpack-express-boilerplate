class HomeController < ApplicationController
  def index
  	@todos = Todo.pluck(:id, :content)
  end
end
