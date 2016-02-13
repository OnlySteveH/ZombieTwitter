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
  	@tweets = Tweet.all
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
end
