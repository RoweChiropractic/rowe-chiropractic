RSpec.describe CmsPage do
  let(:cms_page) { cms_pages(:about_us) }

  it { is_expected.to validate_uniqueness_of :title }
  it { is_expected.to validate_presence_of :title }
  it { is_expected.to validate_uniqueness_of :slug }
  it { is_expected.to validate_presence_of :slug }

  describe '#formatted_body' do
    context 'with no body' do
      before do
        cms_page.update! body: nil
      end

      it 'returns nil' do
        expect(cms_page.formatted_body).to eq nil
      end
    end
  end

  describe '#partial' do
    it 'returns a valid partial name from title' do
      expect(cms_page.partial).to eq 'about_us'
    end
  end
end
