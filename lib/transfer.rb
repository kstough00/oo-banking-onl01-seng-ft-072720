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
    if @sender.deposit( @amount * -1 ) 
      @receiver.deposit( @amount )
      @status = "complete"
    elsif @status == "complete"
      puts "Transaction was already executed"
    else
      @sender.balance < @amount
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end
  end
# @sender.balance < @amount
#       @status = "rejected"
#       return "Transaction rejected. Please check your account balance."
#   @sender.deposit( @amount * -1 ) 
#       @receiver.deposit( @amount )
#       @status = "complete"
  
end
