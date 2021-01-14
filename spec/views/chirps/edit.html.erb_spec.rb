require 'rails_helper'

RSpec.describe "chirps/edit", type: :view do
  before(:each) do
    @chirp = assign(:chirp, Chirp.create!(
      text: "MyString"
    ))
  end

  it "renders the edit chirp form" do
    render

    assert_select "form[action=?][method=?]", chirp_path(@chirp), "post" do

      assert_select "input[name=?]", "chirp[text]"
    end
  end
end
