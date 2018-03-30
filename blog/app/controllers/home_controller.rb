
class HomeController < ApplicationController
  
    before_action :create_client
  
    def index
      batch_size = 20
      @twitter_handle = "Casetabs"
  
      @tweets = @client.user_timeline(@twitter_handle).take(batch_size)    
      @friends = @client.friends(@twitter_handle)
      @followers = @client.followers(@twitter_handle).take(batch_size)
  
      @tweettext = []
      @tweets.each do |tweet|
        @tweettext.push(tweet.text.gsub(/@{1}\w+/) { |name| '<a href = "/'+'profile/' + name[1..-1] +'">'+ name + '</a>'})
      end
    
    
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
  