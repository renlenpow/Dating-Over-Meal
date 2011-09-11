ActiveModel::Errors.class_eval do
  
  def flatten_to_string
    self.messages.collect { |e| e.flatten.join(" ").ucfirst }
  end
  
end