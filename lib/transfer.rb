require 'pry'
class Transfer
  attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def valid?
    sender.valid? && receiver.valid?    
  end

  def execute_transaction
    if valid? && @status == "pending" && sender.balance > self.amount
      sender.balance -= self.amount
      receiver.balance += self.amount
      @status = "complete"
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."

    end
    #binding.pry
    
  end

  def reverse_transfer
    
    sender.balance += self.amount
    receiver.balance -= self.amount
    @status = "reversed" if execute_transaction 
    #binding.pry
  end

end
