class Person
  attr_accessor :first_name, :last_name, :ssn

  def save
    http.post(:first_name, :last_name, :ssn).to('http://www.example.com')
  end

  private

  def http
    GatewayExpressionBuilder.new(self)
  end
end

class Company
  attr_accessor :name, :tax_id

  def save
    http.get(:name, :tax_id).to('http://www.example.com')
  end

  private

  def http
    GatewayExpressionBuilder.new(self)
  end
end

class Laptop
  attr_accessor :assigned_to, :serial_number

  def save
    def save
      http.post(:assigned_to, :serial_number).with_authentication.to('')
    end
  end

  private

  def http
    GatewayExpressionBuilder.new(self)
  end
end
