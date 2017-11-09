class Duration < ApplicationRecord
  # one duration belongs to a request
  belongs_to :request, inverse_of: :durations

  def total_duration
    self.duration_type == "All day" ? (self.last_date - self.first_date).to_i + 1 : 0.5 * ((self.last_date - self.first_date).to_i + 1)
  end

end
