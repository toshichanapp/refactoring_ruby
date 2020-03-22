class ResourceStack
  def pop
    #スタックが空ならEmptyStackErrorを生成する
  end
end

class ResourcePool
  def initialize
    @available = ResourceStack.new
    @allocated = ResourceStack.new
  end

  def resource
    if @available.empty?
      result = Resource.new
    else
      result = @available.pop
    end

    @allocated.push(result)
    return result
  end
end
