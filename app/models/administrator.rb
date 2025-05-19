class Administrator < ApplicationRecord
  devise :database_authenticatable, :recoverable, :rememberable, :validatable, :tracable
end
