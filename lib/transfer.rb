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
   if @sender.status != "closed"
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
     "Transaction rejected. Please check your account balance."
   end 
 end 
 
 def reverse_transfer
  if @status == "complete"
    @sender = @sender_safety
    @receiver = @receiver_safety
    @sender.balance += @amount 
    @receiver.balance -= @amount
    @status = "reversed"
    return
  end
 end
 
end