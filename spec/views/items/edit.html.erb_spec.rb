require 'rails_helper'

RSpec.describe "items/edit", type: :view do
  let(:item) {
    Item.create!(
      price: "9.99",
      name: "MyString",
      description: "MyText",
      image_url: "MyString"
    )
  }

  before(:each) do
    assign(:item, item)
  end

  it "renders the edit item form" do
    render

    assert_select "form[action=?][method=?]", item_path(item), "post" do

      assert_select "input[name=?]", "item[price]"

      assert_select "input[name=?]", "item[name]"

      assert_select "textarea[name=?]", "item[description]"

      assert_select "input[name=?]", "item[image_url]"
    end
  end
end
