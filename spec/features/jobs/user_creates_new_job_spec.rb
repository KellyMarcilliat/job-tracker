require 'rails_helper'

describe "User creates a new job" do
  it "should allow user to create a new job" do
    company = Company.create!(name: "ESPN")
    category = Category.create!(title: "Category 1")
    visit jobs_path

    click_link "Add New Job"

    expect(current_path).to eq(new_job_path)

    select "Category 1", from: "job[category_id]"
    fill_in "job[title]", with: "Developer"
    select "ESPN", from: "job[company_id]"
    fill_in "job[description]", with: "So fun!"
    select "4 stars", from: "job[level_of_interest]"
    fill_in "job[city]", with: "Denver"

    click_button "Create"

    expect(current_path).to eq(job_path(Job.last))
    expect(page).to have_content("ESPN")
    expect(page).to have_content("Developer")
    expect(page).to have_content("4 stars")
    expect(page).to have_content("Denver")
  end
  it 'has a link to create new category' do
    company = Company.create!(name: 'ESPN')
    category = Category.create!(title: 'Test Category')

    visit new_job_path

    click_link 'Add New Category'

    expect(current_path).to eq(new_category_path)
  end
end
