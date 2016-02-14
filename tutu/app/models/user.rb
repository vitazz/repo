class User < ActiveRecord::Base

  has_many :tickets

  validates :username, presence: true, uniqueness: true
end
