class Transfer
  attr_accessor :sender, :receiver, :status, :amount
  
  def initialize(sender, receiver, status = "pending", amount)
    @sender = sender
    @receiver = receiver
    @status = status
    @amount = amount 
  end 
  
  def valid?
    if sender.valid? == true && receiver.valid? == true 
      return true 
    else 
      return false 
    end 
  end
  
  def execute_transaction
    if self.valid? == true && self.status == "pending"
      sender.balance -= amount
      receiver.balance += amount
      self.status = "complete"
    else  
      self.status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end 
  end 
  
  def reverse_transfer
    if self.status == "complete"
      sender.balance += amount
      receiver.balance -= amount
      self.status = "reversed"
    end
  end
end







