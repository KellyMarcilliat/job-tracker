require 'rails_helper'

describe "User sees one company" do
  scenario "a user sees a company" do
    category = Category.create!(title: "Category 1")
    company = Company.create!(name: "ESPN")

    visit company_path(company)

    expect(current_path).to eq("/companies/#{company.id}")
    expect(page).to have_content("ESPN")
  end
end
