class Zombie < ApplicationRecord
  has_one :brain, dependent: :destroy

  before_save :make_rotting

  def make_rotting
    self.rotting = true if age > 20
  end

  scope :rotting, -> { where(rotting: true) }
  scope :fresh, lambda { where("age < 20").limit(3) }
  scope :recent, proc { order("created_at desc") }
end
