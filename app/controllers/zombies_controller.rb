class ZombiesController < ApplicationController
  before_action :set_zombie, only: [:decomp, :show, :edit, :update, :destroy]

  # GET /zombies
  # GET /zombies.json
  def index
    @zombies = Zombie.includes(:brain).all
  end

  # GET /zombies/1
  # GET /zombies/1.json
  def show
  end

  def decomp
    if @zombie.decomp == 'Dead (again)'
      render json: @zombie.to_json(except: [:updated_at, :id]),
                    status: :unprocessable_entity
    else
      render json: @zombie.to_json(only: :decomp), status: :ok
    end
  end

  def as_json(options = nil)
    super(options || {include: :brain, except: [:created_at, :updated_at, :id]})
  end

  # GET /zombies/new
  def new
    @zombie = Zombie.new
  end

  # GET /zombies/1/edit
  def edit
  end

  # POST /zombies
  # POST /zombies.json
  def create
    @zombie = Zombie.new(zombie_params)
    brain = params[:zombie][:flavor]
    @zombie.create_brain(flavor: brain) if brain

    respond_to do |format|
      if @zombie.save
        format.html { redirect_to @zombie, notice: 'Zombie was successfully created.' }
        format.json { render :show, status: :created, location: @zombie }
      else
        format.html { render :new }
        format.json { render json: @zombie.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /zombies/1
  # PATCH/PUT /zombies/1.json
  def update
    respond_to do |format|
      if @zombie.update(zombie_params)
        format.html { redirect_to @zombie, notice: 'Zombie was successfully updated.' }
        format.json { render :show, status: :ok, location: @zombie }
      else
        format.html { render :edit }
        format.json { render json: @zombie.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /zombies/1
  # DELETE /zombies/1.json
  def destroy
    @zombie.destroy
    respond_to do |format|
      format.html { redirect_to zombies_url, notice: 'Zombie was successfully destroyed.' }
      format.json { head :no_content }
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_zombie
      @zombie = Zombie.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def zombie_params
      params.require(:zombie).permit(:name, :bio, :age, :email, :rotting, :flavor, :decomp )
    end
end
