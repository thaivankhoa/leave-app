class Request < ApplicationRecord
  # one request have many duration
  has_many :durations, dependent: :destroy, inverse_of: :request
  # one request belong to one user
  belongs_to :user

  # -- review relationship -- one request have many reviewers
  has_many :permissions
  has_many :reviewers, :through => :permissions, :source => :user

  # -- cc relationship -- one request have many cc_users
  has_many :ccs
  has_many :cc_users, :through => :ccs, :source => :user

  accepts_nested_attributes_for :durations, allow_destroy: true

  #validation
  validates_presence_of :ccer, :request_type, :reason, :status, :user_id

  def total_duration
    durations.inject(0) { |sum, duration| sum + duration.total_duration}
  end

  def from_date
    first_date_arr = []
    self.durations.each do |duration|
      first_date_arr.push(duration.first_date)
    end
    first_date_arr.min
  end

  def to_date
    last_date_arr = []
    self.durations.each do |duration|
      last_date_arr.push(duration.last_date)
    end
    last_date_arr.max
  end

  def approve_request
    update_attribute(:status, "Approved")
  end

  def deny_request
    update_attribute(:status, "Denied")
  end

  def return_to_pending_state
    update_attribute(:status, "Pending")
  end

  def reviewed_request?
    status != "Pending"
  end
end
