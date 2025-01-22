require 'rails_helper'

RSpec.describe "equipaments/show", type: :view do
  before(:each) do
    assign(:equipament, Equipament.create!(
      name: "Name",
      serial_number: "Serial Number",
      category: "Category"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Serial Number/)
    expect(rendered).to match(/Category/)
  end
end
