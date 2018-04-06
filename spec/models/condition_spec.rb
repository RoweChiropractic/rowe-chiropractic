RSpec.describe Condition do
  it { is_expected.to validate_presence_of :name }
  it { is_expected.to have_many(:conditions).through(:patient_conditions) }
end
