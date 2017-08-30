require 'rails_helper'

RSpec.describe Wiki, type: :model do

  let(:wiki) { create(:wiki) }
  let(:user) { create(:user) }
  
  it { is_expected.to belong_to(:user) }

  it { is_expected.to validate_presence_of(:user) }
  it { is_expected.to validate_presence_of(:title) }
  it { is_expected.to validate_presence_of(:body) }

  describe "attributes" do
     it "has title, body, and user attributes" do
       expect(wiki).to have_attributes(title: wiki.title, body: wiki.body)
     end
   end
end
