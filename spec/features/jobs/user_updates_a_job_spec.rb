require 'rails_helper'

describe 'Job Edit' do
  describe 'user clicks edit link and is brought to edit form page' do
    it 'should update a job' do
      category = Category.create(title: "Cat 1")
      company = Company.create(name: "Shopify")
      job = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver", category_id: category.id)

      visit job_path(job)

      click_link "Edit"

      expect(current_path).to eq(edit_job_path(job))

      fill_in "job[title]", with: "Analyst"
      fill_in "job[description]", with: "So fun!"
      select "5 stars", from: "job[level_of_interest]"
      fill_in "job[city]", with: "San Francisco"

      click_button "Update"

      expect(current_path).to eq(job_path(job))
      expect(page).to have_content("Analyst")
      expect(page).to have_content("So fun!")
      expect(page).to have_content("5")
      expect(page).to have_content("San Francisco")
    end
  end
end
