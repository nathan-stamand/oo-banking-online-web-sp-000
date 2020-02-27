class Transfer
 attr_accessor :sender, :receiver, :amount, :status
 attr_reader 
 
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
   if (@sender.balance - @amount) > 0
    @sender.balance -= @amount
    @receiver.balance += @amount
    @status = "complete"
    @sender_post = @sender
    @sender = nil 
   else
    "Transaction rejected. Please check your account balance."
  end
 end 
 
 def reverse_transfer
   
 end
 
end