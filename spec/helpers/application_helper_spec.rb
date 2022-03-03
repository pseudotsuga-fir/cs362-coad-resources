require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do
  describe "#full_title" do
    it "returns the base title when not given an argument" do
      expect(helper.full_title).to eq('Disaster Resource Network')
    end

    it "returns a combination of passed in argument and base title" do
      expect(helper.full_title('FakeTitle')).to eq ('FakeTitle | Disaster Resource Network')
    end
  end
end
