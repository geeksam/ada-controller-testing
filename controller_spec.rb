describe MessagesController do
  it "posts to campfire using Tinder" do
    message = "This is a test, yo"

    campfire = double("Tinder::Campfire")
    expect(Tinder::Campfire).to receive(:new).and_return(campfire)
    room = double("Tinder::Campfire room")
    expect(campfire).to receive(:find_room_by_name).and_return(room)
    expect(room).to receive(:speak).with(message)

    post :post_message, message: message
    expect(response).to be_redirect
  end

  it "posts to campfire using CampfirePoster"
end

describe CampfirePoster do
  it "talks to campfire using Tinder"
end
