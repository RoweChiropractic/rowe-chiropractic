RSpec.feature 'As an admin user' do
  let(:cms_page) { cms_pages(:about_us) }

  scenario 'I can view a CmsPage' do
    visit cms_page_path(cms_page)
    expect(page).to have_content cms_page.title
    expect(page).to have_content cms_page.sub_title
    expect(page).to have_content cms_page.body
  end

  context 'without a body' do
    before do
      cms_page.update! body: nil
    end

    scenario 'I can view a CmsPage' do
      visit cms_page_path(cms_page)
      expect(page).to have_content cms_page.title
      expect(page).to have_content cms_page.sub_title
    end
  end
end
