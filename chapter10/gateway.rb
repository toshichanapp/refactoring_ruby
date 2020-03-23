class Gateway
  attr_accessor :subject, :attributes, :to

  def self.save
    gateway = self.new
    yield gateway
    gateway.execute
  end

  def execute
    request = Net::HTTP::Post.new(url.path)
    attribute_hash = attributes.inject({}) do |result, attribute|
      result[:attribute.to_s] = subject.send attribute
      result
    end
    request.set_form_data(attribute_hash)
    Net::HTTP.new(url.host, url.port).start{ |http| http.request(request) }
  end

  def url
    URI.parse(to)
  end
end
