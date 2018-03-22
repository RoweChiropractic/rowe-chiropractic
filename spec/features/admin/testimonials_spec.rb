RSpec.feature 'As an admin user' do
  let(:title) { FFaker::CheesyLingo.title }
  let(:body) { FFaker::CheesyLingo.paragraph }
  let(:author) { FFaker::Name.name }
  let(:featured) { FFaker::Boolean.sample }

  before { login }

  scenario 'I can manage Testimonials' do
    visit admin_testimonials_path
    click_on 'New Testimonial'
    click_on 'Create Testimonial'
    expect(page).to have_content I18n.t 'errors.messages.blank'
    fill_in 'Title', with: title
    fill_in 'Body', with: body
    fill_in 'Author', with: author
    check 'Featured?'
    click_on 'Create Testimonial'
    expect(page).to have_content 'Testimonial was successfully created.'
    click_on 'Testimonials'
    expect(page).to have_css :tr, text: title
  end
end
