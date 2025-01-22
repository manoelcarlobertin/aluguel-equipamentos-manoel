require 'rails_helper'

RSpec.describe "equipaments/index", type: :view do
  before(:each) do
    assign(:equipaments, [
      Equipament.create!(
        name: "Name",
        serial_number: "Serial Number",
        category: "Category"
      ),
      Equipament.create!(
        name: "Name",
        serial_number: "Serial Number",
        category: "Category"
      )
    ])
  end

  it "renders a list of equipaments" do
    render
    cell_selector = 'div>p'
    assert_select cell_selector, text: Regexp.new("Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Serial Number".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Category".to_s), count: 2
  end
end
