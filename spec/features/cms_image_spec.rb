RSpec.feature 'As a admin' do
  let(:user) { users(:admin) }
  let(:title) { FFaker::Lorem.sentence }
  let(:description) { FFaker::HipsterIpsum.paragraph }

  before do
    login
    visit admin_cms_images_path
  end

  scenario 'I can create CmsImages' do
    click_on 'New Cms Image'
    fill_in 'Title', with: title
    fill_in 'Description', with: description
    attach_file 'Image', Rails.root.join('spec/fixtures/logo.png')
    click_on 'Create Cms image'
    expect(page).to have_content title
    expect(page).to have_content description
    expect(page).to have_css("img[src*='logo.png']")
  end
end
