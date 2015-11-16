module AsJson
  extend ActiveSupport::Concern

  def as_json(options={})
    super(:only => [:id, :text])
  end
end