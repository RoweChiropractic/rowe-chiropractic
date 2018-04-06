RSpec.describe Xray do
  it { is_expected.to validate_presence_of :date }
  it { is_expected.to validate_presence_of :file }
  it { is_expected.to validate_presence_of :name }
end
