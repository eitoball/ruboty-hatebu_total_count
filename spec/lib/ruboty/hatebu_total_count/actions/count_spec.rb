require 'spec_helper'

describe Ruboty::HatebuTotalCount::Actions::Count do
  describe '#call' do
    it 'should call #reply on message' do
      message = double('message')
      allow(message).to receive(:[]).with(:site).and_return('http://www.google.com/')
      expect(message).to receive(:reply)

      described_class.new(message).call
    end
  end
end
