class TweetsController < ApplicationController
  before_action :get_zombie
  before_action :set_tweet, only: [:show, :edit, :update, :destroy]

  def get_zombie
    @zombie = Zombie.find(params[:zombie_id])
  end

  def index
    @tweets = @zombie.tweets
  end

  def show
  end

  def new
    @tweet = Tweet.new
  end

  def edit
  end

  def create
    @tweet = @zombie.tweets.new(tweet_params)

    respond_to do |format|
      if @tweet.save
        format.html { redirect_to [@zombie, @tweet], notice: 'Tweet was successfully created.' }
        format.json { render :show, status: :created, location: [@zombie, @tweet] }
      else
        format.html { render :new }
        format.json { render json: @tweet.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @tweet.update(tweet_params)
        format.html { redirect_to [@zombie, @tweet], notice: 'Tweet was successfully updated.' }
        format.json { render :show, status: :ok, location: [@zombie, @tweet] }
      else
        format.html { render :edit }
        format.json { render json: @tweet.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @tweet.destroy
    respond_to do |format|
      format.html { redirect_to zombie_tweets_url, notice: 'Tweet was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_tweet
      @tweet = @zombie.tweets.find(params[:id])
    end

    def tweet_params
      params.require(:tweet).permit(:status, :zombie_id)
    end
end
