RSpec.describe PatientSpecialty do
  it { is_expected.to belong_to :patient }
  it { is_expected.to belong_to :specialty }
end
