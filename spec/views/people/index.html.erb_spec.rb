require 'rails_helper'

RSpec.describe "people/index", type: :view do
  before(:each) do
    assign(:people, [
      Person.create!(
        rut: "Rut",
        name: "Name",
        last_name: "Last Name",
        age: "Age",
        course: "Course"
      ),
      Person.create!(
        rut: "Rut",
        name: "Name",
        last_name: "Last Name",
        age: "Age",
        course: "Course"
      )
    ])
  end

  it "renders a list of people" do
    render
    assert_select "tr>td", text: "Rut".to_s, count: 2
    assert_select "tr>td", text: "Name".to_s, count: 2
    assert_select "tr>td", text: "Last Name".to_s, count: 2
    assert_select "tr>td", text: "Age".to_s, count: 2
    assert_select "tr>td", text: "Course".to_s, count: 2
  end
end
