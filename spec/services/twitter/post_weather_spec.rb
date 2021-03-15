require 'rails_helper'

describe Twitter::PostWeather, type: :service do
  describe '#tweet' do
    let(:message) { 'This is a tweet' }

    context 'should post tweet' do
      it 'successfully with valid params' do
        result = described_class.new(message).tweet
        expect(result.class).to eq Twitter::Tweet
      end
    end
  end
end
