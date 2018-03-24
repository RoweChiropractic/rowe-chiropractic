RSpec.describe NullCmsPage do
  let(:slug) { 'test-page' }
  let(:null_cms_page) { described_class.new(slug) }

  describe '#id' do
    it 'returns nil' do
      expect(null_cms_page.id).to eq nil
    end
  end

  describe '#partial' do
    it 'returns nil' do
      expect(null_cms_page.partial).to eq nil
    end
  end

  describe '#children' do
    it 'returns nil' do
      expect(null_cms_page.children).to eq []
    end
  end
end
