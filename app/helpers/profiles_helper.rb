module ProfilesHelper
  def hours_passed(from)
    (Time.now.to_i - from.to_i) / (24*60*60)
  end
end
