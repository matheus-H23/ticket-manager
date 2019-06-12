class Kind < ApplicationRecord
  has_many :tickets, dependent: :destroy
end
