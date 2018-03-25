RSpec.describe Inquiry do
  let(:inquiry) { described_class.new }

  describe '#phone_or_email' do
    let(:inquiry) { described_class.new }
    let(:email) { FFaker::Internet.email }
    let(:phone) { FFaker::PhoneNumber.short_phone_number }

    context 'when both are blank' do
      it 'invalidates the record' do
        expect(inquiry).not_to be_valid
      end
    end

    context 'when email present, phone blank' do
      before do
        inquiry.email = email
      end

      it 'validates the record' do
        expect(inquiry).to be_valid
      end
    end

    context 'when phone present, email blank' do
      before do
        inquiry.phone = phone
      end

      it 'validates the record' do
        expect(inquiry).to be_valid
      end
    end

    context 'when phone present, email present' do
      before do
        inquiry.phone = phone
        inquiry.email = email
      end

      it 'validates the record' do
        expect(inquiry).to be_valid
      end
    end
  end

  describe '#full_name' do
    let(:first_name) { FFaker::Name.first_name }
    let(:last_name) { FFaker::Name.last_name }

    before do
      inquiry.first_name = first_name
      inquiry.last_name = last_name
    end

    it 'concatenates first and last' do
      expect(inquiry.full_name).to eq "#{first_name} #{last_name}"
    end
  end
end
