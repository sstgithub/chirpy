require 'rails_helper'

RSpec.describe "chirps/show", type: :view do
  before(:each) do
    @chirp = assign(:chirp, Chirp.create!(
      text: "Text"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Text/)
  end
end
