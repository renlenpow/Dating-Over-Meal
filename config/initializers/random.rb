Random.class_eval do
  
  def self.rand_time(from, to)
    Time.at(rand_in_range(from.to_f, to.to_f))
  end

  def self.rand_in_range(from, to)
    rand * (to - from) + from
  end
  
end