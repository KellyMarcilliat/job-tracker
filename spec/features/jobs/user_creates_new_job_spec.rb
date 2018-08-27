require 'rails_helper'

describe "User creates a new job" do
  scenario "a user can create a new job" do
    category = Category.create!(title: "Category 1")
    company = Company.create!(name: "ESPN")

    visit jobs_path

    click_link 'Add New Job'

    expect(current_path).to eq(new_job_path)

    select "Test Category", from: "job[category_id]"
    fill_in "job[title]", with: "Developer"
    select "ESPN", from: "job[company_id]"
    fill_in "job[description]", with: "So fun!"
    fill_in "job[level_of_interest]", with: 80
    fill_in "job[city]", with: "Denver"

    click_button "Create"

    expect(current_path).to eq("/jobs/#{Job.last.id}")
    expect(page).to have_content("ESPN")
    expect(page).to have_content("Developer")
    expect(page).to have_content("80")
    expect(page).to have_content("Denver")
  end
end
