class Person
  attr_accessor :first_name, :last_name, :ssn

  def save
    Gateway.save do |persist|
      persist.subject = self
      persist.attributes = [:first_name, :last_name, :ssn]
      persist.to = 'http://www.example.com/person'
    end
  end
end

class Company
  attr_accessor :name, :tax_id

  def save
    url = URI.parse('')
    request  = Net::HTTP::Get.new(url.path, "?name=#{name}&#{tax_id}")
    Net::HTTP.new(url.host, url.port).start{ |http| http.request(request) }
  end
end

class Laptop
  attr_accessor :assigned_to, :serial_number

  def save
    url = URI・Parse('http://www.example.com/person')
    request = Net::HTTP::Post.new(url.Path)
    request.basic_auth('username', 'password')
    request.set_form_data(
      'assigned_to' => assigned_to,
      'serial_number' => serial_number
    )
    Net::HTTP.new(url.host, url.port).start { |http| http.request(request) }
  end
end
