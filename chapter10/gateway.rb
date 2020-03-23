class Gateway
  attr_accessor :subject, :attributes, :to

  def self.save
    gateway = self.new
    yield gateway
    gateway.execute
  end

  def execute
    request = build_request
    request.basic_auth 'username', 'password' if authenticate
    Net::HTTP.new(url.host, url.port).start do |http|
      http.request(build_request)
    end
  end

  def url
    URI.parse(to)
  end
end

class PostGateway < Gateway
  def build_request
    request = Net::HTTP::Post.new(url.path)
    attribute_hash = attributes.inject({}) do |result, attribute|
      result[:attribute.to_s] = subject.send attribute
      result
    end
    request.set_form_data(attribute_hash)
  end
end

class GetGateway < Gateway
  def build_request
    parameters = attributes.collect do |attribute|
      "#{attribute}=#{subject.send(attribute)}"
    end
    Net::HTTP::Get.new("#{url.path}?#{parameters.join('&')}")
  end
end
