require 'rails_helper'

describe 'Job Edit' do
  describe 'user clicks edit link and is brought to edit form page' do
    it 'should update a job' do
      category = Category.create(title: "Cat 1")
      company = Company.create(name: "Shopify")
      job = company.jobs.create(title: "First Job", level_of_interest: 90, city: "Denver", category_id: category.id)

      visit company_job_path(company, job)

      click_link("Edit")
      expect(current_path).to eq(edit_company_job_path(company, job))

      fill_in("job[title]", with: "New Title")
      fill_in("job[level_of_interest]", with: 75)
      fill_in("job[city]", with: "Aurora")
      click_on("Update Job")

      expect(current_path).to eq(company_job_path(company, job))

      expect(page).to have_content("New Title")
      expect(page).to_not have_content("First Job")

    end
  end
end
