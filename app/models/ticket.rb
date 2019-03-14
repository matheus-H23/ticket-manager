class Ticket < ApplicationRecord
  belongs_to :kind
  belongs_to :status
  belongs_to :assignee, class_name: 'User'
  belongs_to :reporter, class_name: 'User'
  has_many :ticketlog, dependent: :destroy
end
