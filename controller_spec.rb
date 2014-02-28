describe MessagesController do
  let(:message) {  "This is a test, yo" }

  it "posts to campfire using Tinder" do
    campfire = double("Tinder::Campfire")
    expect(Tinder::Campfire).to receive(:new).and_return(campfire)
    room = double("Tinder::Campfire room")
    expect(campfire).to receive(:find_room_by_name).and_return(room)
    expect(room).to receive(:speak).with(message)

    post :post_message, message: message
    expect(response).to be_redirect
  end

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
end
