class ProfileController < ApplicationController
  before_action :create_client
  
    def index
      batch_size = 20
      @twitter_handle = params[:handle]
      puts "This is the handle from profile #{@twitter_handle}"
      @tweets = @client.user_timeline(@twitter_handle).take(batch_size)    
      @friends = @client.friends(@twitter_handle).take(batch_size)
      @followers = @client.followers(@twitter_handle).take(batch_size)
  
      # if params[:search]
      #   # @tweets = tweets.search(params[:search]).order("created_at DESC")
      #   @twitter_handle = params[:search]
      # # else
      # #   # @tweets = @tweets.all.order("created_at DESC")
      # #   @twitter_handle = "Casetabs"
      # end
    
    end

    def search 
      redirect_to :controller => 'profile', :action => 'index', :handle => params[:handle]

    end
      
    

private

  def create_client
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key        = "AAgdYkYfGss9pPY2EwZDwbtrc"
      config.consumer_secret     = "lnWvdOORawjmIcXDJTlAksbKHfMMzQs88GKTkX8P3K8qvdl5sQ"
      config.access_token        = "944937415-TMHk0Dt1yYanl9VRvP0e1r3efjnHQjcmahZnDiQT"
      config.access_token_secret = "zb2Yyn4t7NngTQKOtumT0vJFucPOEBUjRvQgneao0HL7R"
    end
  end
end
