class String
  def sanitize
    ActionController::Base.helpers.sanitize(self)
  end
end
