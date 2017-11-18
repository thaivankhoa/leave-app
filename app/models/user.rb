class User < ApplicationRecord

  # one user have many request
  has_many :requests, dependent: :destroy

  # -- review relationship -- one user have many pending requests that need to review
  has_many :permissions
  has_many :pending_requests, :through => :permissions, :source => :request

  # -- cc relationship -- one user have many requests that include this users in request's cc-list
  has_many :ccs
  has_many :cc_requests, :through => :ccs, :source => :request

  def update_wfh_days(wfh_duration)
    update_attribute(:wfh_day, wfh_day + wfh_duration)
  end

  def update_taken_days(leave_duration)
    update_attribute(:taken, taken + leave_duration)
    update_balance
  end

  def update_balance
    update_attribute(:balance, carried - taken)
  end

  def balance_valid?(leave_duration)
    (carried - taken - leave_duration) > -5
  end

  
end
