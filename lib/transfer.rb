class Transfer
  attr_accessor :sender, :receiver, :amount, :status, :count
  
  def initialize(sender, receiver, amount)
    @sender = sender
    @amount = amount
    @receiver = receiver
    @status = "pending"
  end
  
  def valid?
    if sender.valid? && receiver.valid?
      true 
    else
      false
    end
  end
  
 def execute_transaction
    if @sender.balance > @amount && @status == "pending"
      @sender.balance -= @amount
      @receiver.balance += @amount
      @status = "complete"
    else
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end
  end

  
  
end
