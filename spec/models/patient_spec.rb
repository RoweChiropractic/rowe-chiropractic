RSpec.describe Patient do
  it { is_expected.to validate_presence_of :first_name }
  it { is_expected.to validate_presence_of :last_name }
  it { is_expected.to have_many(:conditions).through(:patient_conditions) }
end
