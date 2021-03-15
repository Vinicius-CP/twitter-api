require 'rails_helper'

describe Weather::GetWeek, type: :service do
  describe '#weather_info' do
    let(:api_key) { Rails.application.credentials.dig(:weather, :api_key) }
    let(:valid_params) {{ city: 'Sao Paulo', api_key: api_key }}
    let(:invalid_params) {{ city: '', api_key: '' }}
    let(:expected_error) {{:error=>"Invalid parameters"}}

    context 'should return message' do
      it 'successfully with valid params' do
        result = described_class.new(valid_params).weather_info
        expect(result.class).to eq String
      end
    end

    context 'should return message' do
      it 'error with invalid params' do
        result = described_class.new(invalid_params).weather_info
        expect(result).to eq expected_error
      end
    end
  end
end
