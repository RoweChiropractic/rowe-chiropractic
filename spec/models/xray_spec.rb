RSpec.describe Xray do
  it { is_expected.to validate_presence_of :date }
  it { is_expected.to validate_presence_of :file }
  it { is_expected.to validate_presence_of :name }

  # describe '.default_scope' do
  #   let(:first_xray) { }
  #   let(:second_xray) { }

  #   it 'sorts by date, ascending' do
  #     expect(xrays).to eq [first_xray, second_xray]
  #   end
  # end
end
