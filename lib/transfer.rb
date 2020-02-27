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
   if @sender.balance == nil || @sender.balance <= 0 || !@sender.valid?
     "Transaction rejected. Please check your account balance."
   else
    @sender.balance -= @amount
    @receiver.balance += @amount
    @status = "complete"
    @sender_post = @sender
    @sender = nil 
  end
 end 
 
 def reverse_transfer
   
 end
 
end
