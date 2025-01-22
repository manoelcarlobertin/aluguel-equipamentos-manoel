require 'rails_helper'

RSpec.describe "equipaments/edit", type: :view do
  let(:equipament) {
    Equipament.create!(
      name: "MyString",
      serial_number: "MyString",
      category: "MyString"
    )
  }

  before(:each) do
    assign(:equipament, equipament)
  end

  it "renders the edit equipament form" do
    render

    assert_select "form[action=?][method=?]", equipament_path(equipament), "post" do

      assert_select "input[name=?]", "equipament[name]"

      assert_select "input[name=?]", "equipament[serial_number]"

      assert_select "input[name=?]", "equipament[category]"
    end
  end
end
