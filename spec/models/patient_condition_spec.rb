RSpec.describe PatientCondition do
  it { is_expected.to belong_to :patient }
  it { is_expected.to belong_to :condition }
end
