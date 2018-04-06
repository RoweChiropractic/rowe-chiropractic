RSpec.describe Testimonial do
  let(:title) { FFaker::CheesyLingo.title }
  let(:body) { FFaker::CheesyLingo.paragraph }

  it { is_expected.to validate_presence_of :title }
  it { is_expected.to validate_presence_of :body }
  it { is_expected.to belong_to :patient }

  describe '#author_or_patient' do
    let(:testimonial) do
      Testimonial.new(
        title: title,
        body: body,
        author: author,
        patient: patient
      )
    end

    context 'with an Author and no Patient' do
      let(:author) { FFaker::Name.name }
      let(:patient) { nil }

      it 'is valid' do
        expect(testimonial).to be_valid
      end
    end

    context 'with a Patient and no Author' do
      let(:author) { nil }
      let(:patient) { patients(:barney) }

      it 'is valid' do
        expect(testimonial).to be_valid
      end
    end

    context 'with no Author and no Patient' do
      let(:author) { nil }
      let(:patient) { nil }

      it 'is invalid' do
        expect(testimonial).not_to be_valid
      end
    end
  end
end
