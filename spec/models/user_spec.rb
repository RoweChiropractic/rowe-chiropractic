RSpec.describe User do
  let(:user) { described_class.new }

  describe '#full_name' do
    let(:first_name) { FFaker::Name.first_name }
    let(:last_name) { FFaker::Name.last_name }

    before do
      user.first_name = first_name
      user.last_name = last_name
    end

    it 'concatenates first and last' do
      expect(user.full_name).to eq "#{first_name} #{last_name}"
    end
  end
end
