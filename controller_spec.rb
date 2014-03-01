describe MessagesController do
  let(:message) {  "This is a test, yo" }

  it "posts to campfire using CampfirePoster" do
    expect(CampfirePoster).to receive(:post).with(message)
    
    post :post_message, message: message
    expect(response).to be_redirect
  end
end

describe CampfirePoster do
  it "posts to campfire using Tinder" do
    campfire = double("Tinder::Campfire")
    expect(Tinder::Campfire).to receive(:new).and_return(campfire)
    room = double("Tinder::Campfire room")
    expect(campfire).to receive(:find_room_by_name).and_return(room)
    expect(room).to receive(:speak).with(message)

    CampfirePoster.post message
  end

  it "posts to campfire", remote: true do
    random_number = rand(100000)
    CampfirePoster.post message + random_number.to_s
    
    # grab a campfire object
    # open the room we were supposed to post to
    # check that our message was actually sent to it
    # (by making sure it includes random_number)
  end
end
