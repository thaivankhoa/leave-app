class Duration < ApplicationRecord
  # one duration belongs to a request
  belongs_to :request, inverse_of: :durations

  def total_duration
    duration_type == "All day" ? (last_date - first_date).to_i + 1 : 0.5 * ((last_date - first_date).to_i + 1)
  end

end
