module TodoConcern
  module Validatable
    extend ActiveSupport::Concern
    included do
      validates :content, presence: true
    end
  end
end
