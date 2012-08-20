class Deck < ActiveRecord::Base
  has_many :cards
  belongs_to :user
  attr_accessible :name
end