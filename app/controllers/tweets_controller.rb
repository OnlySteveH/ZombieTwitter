class TweetsController < ApplicationController
	before_action :get_tweet, only: [:edit, :update, :destroy, :show]
	before_action :check_auth, only: [:edit, :update, :destroy]
	def get_tweet
		@tweet = Tweet.find(params[:id]) 
	end

	def check_auth
  	if session[:zombie_id] != @tweet.zombie_id
  		redirect_to(tweets_path, notice: "Sorry you can't take that action.")
  	end
	end

  def index
  	if params[:name]
  		@zombie = Zombie.where(name: params[:name]).first
  		@tweets = @zombie.tweets
  	else
  		@tweets = Tweet.all
  	end
  	respond_to do |format|
  		format.html #show.html.erb
  		format.json { render json: @tweets }
  		format.xml { render xml: @tweets }
  	end
  end

  def show  	
  	respond_to do |format|
  		format.html #show.html.erb
  		format.json { render json: @tweet }
  		format.xml { render xml: @tweet }
  	end
  end

  def destroy
  	@tweet.destroy
  	render 'index'
  end

  def edit

  end

  def new
  	@tweet = Tweet.create
  end

  def create
    @zombie = Zombie.find(params[:zombie_id])
    location = params[:tweet].delete :location
    @tweet = @zombie.tweets.new(params[:tweet])
    @tweet.build_location(location)

    respond_to do |format|
      if @tweet.save
        format.html { redirect_to @tweet, notice: 'Tweet was successfully created.' }
        format.json { render json: @tweet, status: :created, location: @tweet }
      else
        format.html { render action: "new" }
        format.json { render json: @tweet.errors, status: :unprocessable_entity }
      end
    end

  end
end
