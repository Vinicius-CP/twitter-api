require 'rails_helper'

describe Weather::Message, type: :service do
  describe '#formatted' do
    let(:current_weather_response) do
      JSON.parse(file_fixture('current_weather.json').read, 
        symbolize_names: true)
    end
    
    let(:upcoming_weathers_response) do
      JSON.parse(file_fixture('upcoming_weathers.json').read,
        symbolize_names: true)
    end 
    
    let(:expected_message) do
      "28ºC e algumas nuvens em Florianópolis em 15/03."\
      " Média para os próximos dias: 23ºC em 16/03, 24ºC em 17/03,"\
      " 23ºC em 18/03, 23ºC em 19/03, 22ºC em 20/03."
    end

    let(:result) do
      described_class.new(
        current_weather_response, upcoming_weathers_response
      ).formatted
    end

    context 'should return formatted message' do
      it 'successfully with valid params' do
        expect(result).to eq expected_message
      end
    end
  end
end
