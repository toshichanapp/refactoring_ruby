class BalanceError < StandardError; end

class Account
  def withdraw(amount)
    raise BalanceError.new if amount > @balance
    @balance -= amount
  end
end

# 呼び出しもと
begin
  account.withdrew(amount)
  do_the_usual_thing
rescue BalanceError
  handle_overdrawn
end
