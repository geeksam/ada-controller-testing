class MessagesController < ActionController::Base
  def index
  end

  def post_message
    CampfirePoster.post params[:message]
    redirect_to :root
  end

  class CampfirePoster
    def self.post(message) 
      campfire = Tinder::Campfire.new(some_awful_params)
      room = campfire.find_room_by_name(room_name_from_awful_params)
      room.speak( message )
    end
  end
end
