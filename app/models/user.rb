class User < ApplicationRecord

  # one user have many request
  has_many :requests

  # -- review relationship -- one user have many pending request that need to review
  has_many :permissions
  has_many :pending_requests, :through => :permissions, :source => :request

  def update_wfh_days(wfh_duration)
    update_attribute(:wfh_day, self.wfh_day + wfh_duration)
  end

  def update_taken_days(leave_duration)
    update_attribute(:taken, self.taken + leave_duration)
    self.update_balance
  end

  def update_balance
    update_attribute(:balance, self.carried - self.taken)
  end

  def balance_valid?(leave_duration)
    (balance - leave_duration) > -5 ? true : false
  end
end
