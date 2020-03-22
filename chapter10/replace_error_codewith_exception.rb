class Account
  def withdraw(amount)
    assert("Amount too large"){ amount <= @balance}
    @balance -= amount
  end
end

module Assertion
  class AssertionFailedError < StandardError; end

  def assert(message, &condition)
    unless condition.call
      raise AssertionFailedError.new("Assertion Failed: #{message}")
    end
  end
end

# 呼び出しもと

if !account.can_withdraw?(amount)
  handle_overdrawn
else
  do_the_usual_thing
end
