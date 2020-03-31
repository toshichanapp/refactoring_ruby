class GatewayExpressionBuilder

  def initialize(subject)
    @subject = subject
  end

  def post(attributes)
    @attributes = attributes
    @gateway = PostGateway
  end

  def get(attributes)
    @attributes = attributes
    @gateway = GetGateway
  end

  def wlth_authentication
    @with_authentication = true
  end

  def to(address)
    @gateway.save do |persist|
      persist.subject = @subject
      persist.attributes = @attributes
      persist.authenticate = @with_authentication
      persist.to = address
    end
  end
end
