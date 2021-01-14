require 'rails_helper'

RSpec.describe "chirps/new", type: :view do
  before(:each) do
    assign(:chirp, Chirp.new(
      text: "MyString"
    ))
  end

  it "renders new chirp form" do
    render

    assert_select "form[action=?][method=?]", chirps_path, "post" do

      assert_select "input[name=?]", "chirp[text]"
    end
  end
end
