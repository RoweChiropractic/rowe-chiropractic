RSpec.feature 'As an admin user' do
  let(:title) { FFaker::CheesyLingo.title }
  let(:description) { FFaker::CheesyLingo.sentence }

  before { login }

  scenario 'I can manage Documents' do
    visit admin_documents_path
    click_on 'New Document'
    click_on 'Create Document'
    expect(page).to have_content I18n.t 'errors.messages.blank'
    fill_in 'Title', with: title
    fill_in 'Description', with: description
    attach_file 'File', Rails.root.join('spec/fixtures/test.pdf')
    click_on 'Create Document'
    click_on 'Documents'
    expect(page).to have_css :tr, text: title
  end
end
