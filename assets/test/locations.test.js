import { getLocations, renderResult, render} from '../js/locations';

jest.mock('../js/request');

test('the results are a list of locations', () => {

  const locations = {"message":"accurate","cod":"200","count":5,"list":
  [ {"id":2643743,"name":"London","coord":{"lat":51.5073,"lon":-0.1277},"main":{"temp":286.98,"pressure":1011,"humidity":62,"temp_min":285.15,"temp_max":288.71},"dt":1559037652,"wind":{"speed":5.7,"deg":290},"sys":{"country":"GB"},"rain":null,"snow":null,"clouds":{"all":40},"weather":[{"id":802,"main":"Clouds","description":"scattered clouds","icon":"03d"}]},
    {"id":6058560,"name":"London","coord":{"lat":42.9886,"lon":-81.2467},"main":{"temp":286.67,"pressure":1005,"humidity":93,"temp_min":286.15,"temp_max":287.04},"dt":1559037541,"wind":{"speed":3.1,"deg":100},"sys":{"country":"CA"},"rain":{"1h":5.08},"snow":null,"clouds":{"all":90},"weather":[{"id":502,"main":"Rain","description":"heavy intensity rain","icon":"10d"}]},
    {"id":4517009,"name":"London","coord":{"lat":39.8864,"lon":-83.4483},"main":{"temp":293.93,"pressure":1008,"humidity":94,"temp_min":291.48,"temp_max":296.48},"dt":1559037770,"wind":{"speed":5.1,"deg":220},"sys":{"country":"US"},"rain":null,"snow":null,"clouds":{"all":1},"weather":[{"id":211,"main":"Thunderstorm","description":"proximity thunderstorm","icon":"11n"}]},
    {"id":4298960,"name":"London","coord":{"lat":37.129,"lon":-84.0833},"main":{"temp":293.87,"pressure":1014,"humidity":100,"temp_min":290.15,"temp_max":297.04},"dt":1559037541,"wind":{"speed":2.98,"deg":212.232},"sys":{"country":"US"},"rain":null,"snow":null,"clouds":{"all":1},"weather":[{"id":800,"main":"Clear","description":"sky is clear","icon":"01n"}]},
    {"id":5016884,"name":"London","coord":{"lat":43.5261,"lon":-93.0627},"main":{"temp":283.28,"pressure":1010,"humidity":81,"temp_min":282.04,"temp_max":285.15},"dt":1559037541,"wind":{"speed":3.6,"deg":350},"sys":{"country":"US"},"rain":{"1h":0.25},"snow":null,"clouds":{"all":90},"weather":[{"id":500,"main":"Rain","description":"light rain","icon":"10n"},{"id":701,"main":"Mist","description":"mist","icon":"50n"}]}
  ]};

  return expect(getLocations('London')).resolves.toEqual(locations);
});


test('renders the list of locations', (done) => {

  document.body.innerHTML =
    '<div id="result">' +
    '</div>';

  const renderedElements =
    '<div id="result">' +
      '<ul id="locationsList">' +
        '<li id="2643743" class="item"><a id="2643743" href="/weather?id=2643743">London,GB</a></li>' +
        '<li id="6058560" class="item"><a id="6058560" href="/weather?id=6058560">London,CA</a></li>' +
        '<li id="4517009" class="item"><a id="4517009" href="/weather?id=4517009">London,US</a></li>' +
        '<li id="4298960" class="item"><a id="4298960" href="/weather?id=4298960">London,US</a></li>' +
        '<li id="5016884" class="item"><a id="5016884" href="/weather?id=5016884">London,US</a></li>' +
      '</ul>' +
    '</div>';

  getLocations('London').then(result => {
    renderResult(result)
    expect(document.body.innerHTML).toEqual(renderedElements);
  })
  .catch(function(error) {
    console.log(error);
  })
  .finally(done);

});

test('renders the page', (done) => {

  document.body.innerHTML =
    '<div class="flex">'+
      '<input class="margin-small" type="text" placeholder="Search..." id="city" value="London">' +
      '<button type="button" id="search">Search</button>' +
    '</div>' +
    '<div id="result">' +
    '<ul id="locationsList"></ul>' +
    '</div>';

  const renderedElements =
    '<div class="flex">'+
      '<input class="margin-small" type="text" placeholder="Search..." id="city" value="London">' +
      '<button type="button" id="search">Search</button>' +
    '</div>' +
    '<div id="result">' +
      '<ul id="locationsList">' +
        '<li id="2643743" class="item"><a id="2643743" href="/weather?id=2643743">London,GB</a></li>' +
        '<li id="6058560" class="item"><a id="6058560" href="/weather?id=6058560">London,CA</a></li>' +
        '<li id="4517009" class="item"><a id="4517009" href="/weather?id=4517009">London,US</a></li>' +
        '<li id="4298960" class="item"><a id="4298960" href="/weather?id=4298960">London,US</a></li>' +
        '<li id="5016884" class="item"><a id="5016884" href="/weather?id=5016884">London,US</a></li>' +
      '</ul>' +
    '</div>';

  render().then(() => {
    expect(document.body.innerHTML).toEqual(renderedElements);
  })
  .catch(function(error) {
    console.log(error);
  })
  .finally(done);
});

