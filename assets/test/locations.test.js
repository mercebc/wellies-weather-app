import { getLocations, renderResult, render} from '../js/locations';

jest.mock('../js/request');
jest.mock('../js/api_key');

test('renders the page with results', () => {

  document.body.innerHTML =
    '<div class="flex">'+
      '<input class="margin-small" type="text" placeholder="Search..." id="city" value="London">' +
      '<button type="button" id="search">Search</button>' +
    '</div>' +
    '<section id="result">' +
      '<div id="resultsWrapper"></div>' +
    '</section>';

  const renderedElements =
    '<div class="flex">'+
      '<input class="margin-small" type="text" placeholder="Search..." id="city" value="London">' +
      '<button type="button" id="search">Search</button>' +
    '</div>' +
    '<section id="result">' +
      '<div id="resultsWrapper">' +
        '<ul id="locationsList">' +
          '<li id="2643743" class="item"><a id="2643743" href="/weather?id=2643743">London,GB</a></li>' +
          '<li id="6058560" class="item"><a id="6058560" href="/weather?id=6058560">London,CA</a></li>' +
          '<li id="4517009" class="item"><a id="4517009" href="/weather?id=4517009">London,US</a></li>' +
          '<li id="4298960" class="item"><a id="4298960" href="/weather?id=4298960">London,US</a></li>' +
          '<li id="5016884" class="item"><a id="5016884" href="/weather?id=5016884">London,US</a></li>' +
        '</ul>' +
      '</div>' +
    '</section>';

  render().then(() => {
    return expect(document.body.innerHTML).toEqual(renderedElements);
  })
  .catch(function(error) {
    console.log(error);
  });
});

test('renders the page with not found city', () => {

  document.body.innerHTML =
    '<div class="flex">'+
      '<input class="margin-small" type="text" placeholder="Search..." id="city" value="NotFoundCity">' +
      '<button type="button" id="search">Search</button>' +
    '</div>' +
    '<section id="result">' +
      '<div id="resultsWrapper"></div>' +
    '</section>';

  const renderedElements =
    '<div class="flex">'+
      '<input class="margin-small" type="text" placeholder="Search..." id="city" value="NotFoundCity">' +
      '<button type="button" id="search">Search</button>' +
    '</div>' +
    '<section id="result">' +
      '<div id="resultsWrapper">' +
        '<p id="notFound">City not found</p>' +
      '</div>' +
    '</section>';

  render().then(() => {
    return expect(document.body.innerHTML).toEqual(renderedElements);
  })
  .catch(function(error) {
    console.log(error);
  });
});
