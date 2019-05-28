import { getLocations } from '../js/locations';

jest.mock('../js/request');

const locations = {"message":"accurate","cod":"200","count":5,"list":
  [ {"id":2643743,"name":"london","coord":{"lat":51.5073,"lon":-0.1277},"main":{"temp":286.98,"pressure":1011,"humidity":62,"temp_min":285.15,"temp_max":288.71},"dt":1559037652,"wind":{"speed":5.7,"deg":290},"sys":{"country":"gb"},"rain":null,"snow":null,"clouds":{"all":40},"weather":[{"id":802,"main":"clouds","description":"scattered clouds","icon":"03d"}]},
    {"id":6058560,"name":"london","coord":{"lat":42.9886,"lon":-81.2467},"main":{"temp":286.67,"pressure":1005,"humidity":93,"temp_min":286.15,"temp_max":287.04},"dt":1559037541,"wind":{"speed":3.1,"deg":100},"sys":{"country":"ca"},"rain":{"1h":5.08},"snow":null,"clouds":{"all":90},"weather":[{"id":502,"main":"rain","description":"heavy intensity rain","icon":"10d"}]},
    {"id":4517009,"name":"london","coord":{"lat":39.8864,"lon":-83.4483},"main":{"temp":293.93,"pressure":1008,"humidity":94,"temp_min":291.48,"temp_max":296.48},"dt":1559037770,"wind":{"speed":5.1,"deg":220},"sys":{"country":"us"},"rain":null,"snow":null,"clouds":{"all":1},"weather":[{"id":211,"main":"thunderstorm","description":"proximity thunderstorm","icon":"11n"}]},
    {"id":4298960,"name":"london","coord":{"lat":37.129,"lon":-84.0833},"main":{"temp":293.87,"pressure":1014,"humidity":100,"temp_min":290.15,"temp_max":297.04},"dt":1559037541,"wind":{"speed":2.98,"deg":212.232},"sys":{"country":"us"},"rain":null,"snow":null,"clouds":{"all":1},"weather":[{"id":800,"main":"clear","description":"sky is clear","icon":"01n"}]},
    {"id":5016884,"name":"london","coord":{"lat":43.5261,"lon":-93.0627},"main":{"temp":283.28,"pressure":1010,"humidity":81,"temp_min":282.04,"temp_max":285.15},"dt":1559037541,"wind":{"speed":3.6,"deg":350},"sys":{"country":"us"},"rain":{"1h":0.25},"snow":null,"clouds":{"all":90},"weather":[{"id":500,"main":"rain","description":"light rain","icon":"10n"},{"id":701,"main":"mist","description":"mist","icon":"50n"}]}
  ]};

test('the results are a list of locations', () => {
  return expect(getLocations('London')).resolves.toEqual(locations);
});
