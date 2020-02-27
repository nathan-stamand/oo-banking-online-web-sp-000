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
   if @sender != nil
     if @sender.balance > @amount
       @sender_safety = @sender
       @receiver_safety = @receiver 
       @sender.balance-=@amount
       @receiver.balance+=@amount
       @sender = nil 
       @receiver = nil 
       @status = "complete"
     end
   else 
     @status = "rejected"
     @sender = nil 
     return "Transaction rejected. Please check your account balance."
   end 
 end 
 
 def reverse_transfer
   @sender = @sender_safety
   @receiver = @receiver_safety
   @sender.balance += @amount 
   @receiver.balance -= @amount
   return
 end
 
end