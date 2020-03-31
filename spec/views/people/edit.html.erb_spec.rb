require 'rails_helper'

RSpec.describe "people/edit", type: :view do
  before(:each) do
    @person = assign(:person, Person.create!(
      rut: "MyString",
      name: "MyString",
      last_name: "MyString",
      age: "MyString",
      course: "MyString"
    ))
  end

  it "renders the edit person form" do
    render

    assert_select "form[action=?][method=?]", person_path(@person), "post" do

      assert_select "input[name=?]", "person[rut]"

      assert_select "input[name=?]", "person[name]"

      assert_select "input[name=?]", "person[last_name]"

      assert_select "input[name=?]", "person[age]"

      assert_select "input[name=?]", "person[course]"
    end
  end
end
