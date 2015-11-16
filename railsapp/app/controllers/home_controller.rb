class HomeController < ApplicationController
  include Tokenable
  def index
  	@todos = Todo.all
  end
end
