class Ticket < ApplicationRecord
  belongs_to :kind
  belongs_to :status
  #belongs_to :user
end
