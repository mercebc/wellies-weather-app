import { getCity, clearResults, createList, createEntry, createNotFoundMessage } from '../js/dom';

test('gets the value of a city', () => {
  document.body.innerHTML =
    '<div class="flex">'+
      '<input class="margin-small" type="text" placeholder="Search..." id="city">' +
      '<button type="button" id="search">Search</button>' +
    '</div>';
  document.getElementById("city").value = "Madrid";

  expect(getCity()).toEqual("Madrid");
});


test('clear the location list', () => {
  document.body.innerHTML =
    '<section id="result">' +
      '<div id="resultsWrapper"></div>' +
    '</section>';

  clearResults();

  const clearedContent =
    '<section id="result">' +
    '</section>';

  expect(document.body.innerHTML).toEqual(clearedContent);
});

test('creates a not found message', () => {
  document.body.innerHTML =
    '<section id="result">' +
    '</section>';

  createNotFoundMessage();

  const contentWithNotFoundMessage =
    '<section id="result">' +
      '<div id="resultsWrapper">' +
        '<p id="notFound">City not found</p>' +
      '</div>' +
    '</section>';

  expect(document.body.innerHTML).toEqual(contentWithNotFoundMessage);
});

test('adds a list', () => {
  document.body.innerHTML =
    '<section id="result">' +
    '</section>';

  createList();

  const contentWithList =
    '<section id="result">' +
      '<div id="resultsWrapper">' +
        '<ul id="locationsList"></ul>' +
      '</div>' +
    '</section>';

  expect(document.body.innerHTML).toEqual(contentWithList);
});

test('adds entires to the list', () => {
  document.body.innerHTML =
    '<div id="result">' +
      '<div id="resultsWrapper">' +
        '<ul id="locationsList"></ul>' +
      '</div>' +
    '</div>';

  const element = { "name" : "London", "sys" : { "country" : "GB" }, "id" : "12345" }

  createEntry(element);

  const contentWithEntry =
    '<div id="result">' +
      '<div id="resultsWrapper">' +
        '<ul id="locationsList">' +
          '<li id="12345" class="item"><a id="12345" href="/weather?id=12345">London,GB</a></li>' +
        '</ul>' +
      '</div>' +
    '</div>';

  expect(document.body.innerHTML).toEqual(contentWithEntry);
});
