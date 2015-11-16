class Todo < ActiveRecord::Base
  include TodoConcern::Validatable
end
