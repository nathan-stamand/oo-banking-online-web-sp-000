class Transfer
 attr_accessor :sender, :receiver, :amount, :status
 attr_reader :sender_post, 
 
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
    @sender.balance -= @amount
    @receiver.balance += @amount
    @status = "complete"
    @sender_post = @sender
    @sender = nil 
 end 
 
 def reverse_transfer
   
 end
 
end
