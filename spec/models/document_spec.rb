RSpec.describe Document do
  it { is_expected.to validate_presence_of :file }
  it { is_expected.to validate_presence_of :title }
end
