String.class_eval do
  
  def ucfirst
    self.sub(/^(\w)/) {|s| s.capitalize}
  end
  
end