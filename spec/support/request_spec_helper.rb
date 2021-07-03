module RequestSpecHelper
  def json
    JSON.parse(response.body)
  end

  def added(find)
    data = JSON.parse(response.body)["added"].select do |key, e|
      key["name"] == find
    end
    !data.empty?
  end

  def created(find)
    data = JSON.parse(response.body)["created"].select do |key, e|
      key["name"] == find
    end
    !data.empty?
  end

end