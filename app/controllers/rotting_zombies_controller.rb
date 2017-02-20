class RottingZombiesController < ApplicationController
  def index
    @rotting_zombies = Zombie.rotting
    # @rotting_zombies = Zombie.rotting.fresh
  end
end
