class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable

  #has_many :tickets, dependent: :destroy

  belongs_to :group
  has_many :tickets, foreign_key: 'assignee_id'
  has_many :tickets, foreign_key: 'reporter_id', dependent: :delete_all 
end
