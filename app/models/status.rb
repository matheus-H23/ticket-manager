class Status < ApplicationRecord
  has_many :tickets

  scope :cancel_id, -> { where(description: "Canceled").take.id }
  scope :closed_id, -> { where(description: "Closed").take.id }

end
