require 'rails_helper'

RSpec.describe "people/show", type: :view do
  before(:each) do
    @person = assign(:person, Person.create!(
      rut: "Rut",
      name: "Name",
      last_name: "Last Name",
      age: "Age",
      course: "Course"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Rut/)
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Last Name/)
    expect(rendered).to match(/Age/)
    expect(rendered).to match(/Course/)
  end
end
