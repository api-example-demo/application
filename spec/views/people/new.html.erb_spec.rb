require 'rails_helper'

RSpec.describe "people/new", type: :view do
  before(:each) do
    assign(:person, Person.new(
      rut: "MyString",
      name: "MyString",
      last_name: "MyString",
      age: "MyString",
      course: "MyString"
    ))
  end

  it "renders new person form" do
    render

    assert_select "form[action=?][method=?]", people_path, "post" do

      assert_select "input[name=?]", "person[rut]"

      assert_select "input[name=?]", "person[name]"

      assert_select "input[name=?]", "person[last_name]"

      assert_select "input[name=?]", "person[age]"

      assert_select "input[name=?]", "person[course]"
    end
  end
end
