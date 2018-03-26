RSpec.describe MarkdownParser do
  let(:parser) { OpenStruct.new body: '# Title' }

  before do
    parser.extend described_class
  end

  describe '#formatted_body' do
    it 'renders html' do
      expect(parser.formatted_body).to eq "<h1>Title</h1>\n"
    end
  end
end
