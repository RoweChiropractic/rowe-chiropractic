RSpec.describe Patient do
  let(:patient) { described_class.new }
  it { is_expected.to validate_presence_of :first_name }
  it { is_expected.to validate_presence_of :last_name }
  it { is_expected.to have_many(:conditions).through(:patient_conditions) }
  it { is_expected.to have_one(:testimonial) }

  describe '#full_name' do
    let(:first_name) { FFaker::Name.first_name }
    let(:last_name) { FFaker::Name.last_name }

    before do
      patient.first_name = first_name
      patient.last_name = last_name
    end

    it 'concatenates first and last' do
      expect(patient.full_name).to eq "#{first_name} #{last_name}"
    end
  end

end
