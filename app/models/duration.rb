class Duration < ApplicationRecord
  # one duration belongs to a request
  belongs_to :request, inverse_of: :durations
end
