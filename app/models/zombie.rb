class Zombie < ApplicationRecord
  scope :rotting, -> { where(rotting: true) }
  scope :fresh, lambda { where("age < 20").limit(3) }
  scope :recent, proc { order("created_at desc") }
end
