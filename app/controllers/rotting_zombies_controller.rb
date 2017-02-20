class RottingZombiesController < ApplicationController
  def index
    @rotting_zombies = Zombie.where(rotting: true)
  end
end
