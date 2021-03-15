require 'rails_helper'

describe Api::V1::TwitterWeatherController, type: :controller do
  describe '#week_weather' do
    let(:params) do 
      { twitter_weather: { city: 'Rio de Janeiro', api_key: api_key }}
    end

    let(:invalid_params) {{ twitter_weather: { city: '', api_key: '' }}}
    let(:api_key) { Rails.application.credentials.dig(:weather, :api_key) }
    let(:result) { JSON.parse(response.body, symbolize_names: true) }
    let(:expected_error) { {:message=>{:error=>"Invalid parameters"}} }

    context 'should get week weather' do
      it 'successfully with valid parameters' do
        get :week_weather, params: params
        assert_response :success
      end
    end

    context 'should get week_weather' do
      it 'send error without any parameters' do
        get :week_weather, params: invalid_params
        expect(response.status).to eq 400
        expect(result).to eq expected_error
      end
    end
  end
end
