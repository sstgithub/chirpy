require 'rails_helper'

RSpec.describe "chirps/index", type: :view do
  before(:each) do
    assign(:chirps, [
      Chirp.create!(
        text: "Text"
      ),
      Chirp.create!(
        text: "Text"
      )
    ])
  end

  it "renders a list of chirps" do
    render
    assert_select "tr>td", text: "Text".to_s, count: 2
  end
end
