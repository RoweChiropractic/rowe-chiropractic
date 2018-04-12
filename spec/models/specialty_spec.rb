RSpec.describe Specialty do
  it { is_expected.to validate_presence_of :name }
  it { is_expected.to have_many(:patients).through(:patient_specialties) }
end
