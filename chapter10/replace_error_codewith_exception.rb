class Account
  def withdraw(amount)
    return -1 if amount > @balance
    @balance -= amount
    return 0
  end
end

# 呼び出しもと

if account.withdrew(amount) == -1
  handle_overdrawn
else
  do_the_usual_thing
end
