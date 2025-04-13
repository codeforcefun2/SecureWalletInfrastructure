class Wallet < ApplicationRecord
    validates :address, presence: true, uniqueness: true
  end
  