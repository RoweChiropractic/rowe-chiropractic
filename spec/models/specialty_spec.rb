RSpec.describe Specialty do
  it { is_expected.to validate_presence_of :title }
  it { is_expected.to validate_presence_of :teaser }
  it { is_expected.to validate_presence_of :body }
  it { is_expected.to have_many(:patients).through(:patient_specialties) }
end
