require 'rails_helper'

RSpec.describe "equipaments/new", type: :view do
  before(:each) do
    assign(:equipament, Equipament.new(
      name: "MyString",
      serial_number: "MyString",
      category: "MyString"
    ))
  end

  it "renders new equipament form" do
    render

    assert_select "form[action=?][method=?]", equipaments_path, "post" do

      assert_select "input[name=?]", "equipament[name]"

      assert_select "input[name=?]", "equipament[serial_number]"

      assert_select "input[name=?]", "equipament[category]"
    end
  end
end
