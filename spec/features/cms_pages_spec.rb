RSpec.feature 'As an admin user' do
  let(:user) { users(:admin) }
  let(:title) { FFaker::Lorem.sentence }
  let(:sub_title) { FFaker::HipsterIpsum.sentence }
  let(:cms_page) { cms_pages(:about_us) }

  before do
    login
    visit admin_cms_pages_path
  end

  scenario 'I can create CmsPages' do
    click_on 'New Cms Page'
    fill_in 'Title', with: title
    fill_in 'Sub title', with: sub_title
    click_on 'Create Cms page'
    expect(page).to have_content title
    expect(page).to have_content sub_title
  end

  scenario 'I see CmsPages in the admin area and preview them' do
    within "#cms_page_#{cms_page.id}" do
      click_on 'View'
    end
    expect(page).to have_content cms_page.title
    expect(page).to have_content cms_page.sub_title
    expect(page).to have_css "h1", text: 'Headline'
    within '.row-link' do
      expect(page).to have_content cms_page_path(cms_page)
      click_on 'Preview'
    end
    expect(page).to have_content cms_page.title
  end
end
