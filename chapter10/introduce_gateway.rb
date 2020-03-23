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
    GetGateway.save do |persist|
      persist.subject = self
      persist.attributes = [:name, :tax_id]
      persist.to = ''
    end
  end
end

class Laptop
  attr_accessor :assigned_to, :serial_number

  def save
    PostGateway.save do |persist|
      persist.subject = self
      persist.attributes = [:assigned_to, :serial_number]
      persist.authenticate = true
      persist.to = ''
    end
  end
end
