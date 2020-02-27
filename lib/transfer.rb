class Transfer
 attr_accessor :sender, :receiver, :amount, :status
 
 def initialize(sender, receiver, amount)
   @sender = sender 
   @receiver = receiver
   @amount = amount
   @status = "pending"
 end 
 
 def valid? 
   @sender.valid? && @receiver.valid?
 end
 
 def execute_transaction 
  if @sender.balance < @amount
    "Transaction rejected. Please check your account balance."
  else
    @sender.balance -= @amount
    @receiver.balance += @amount
    @status = "complete"
    @amount = 0
  end
 end 
 
 def reverse_transfer
   
 end
 
end
