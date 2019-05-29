import { getCity, clearResults, createList, createEntry } from '../js/dom';

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
    '<div id="result">' +
      '<ul id="locationsList"></ul>' +
    '</div>';

  clearResults();

  const clearedContent =
    '<div id="result">' +
    '</div>';

  expect(document.body.innerHTML).toEqual(clearedContent);
});

test('adds a list', () => {
  document.body.innerHTML =
    '<div id="result">' +
    '</div>';

  createList();

  const contentWithList =
    '<div id="result">' +
      '<ul id="locationsList"></ul>' +
    '</div>';

  expect(document.body.innerHTML).toEqual(contentWithList);
});

test('adds entires to the list', () => {
  document.body.innerHTML =
    '<div id="result">' +
      '<ul id="locationsList"></ul>' +
    '</div>';

  const element = { "name" : "London", "sys" : { "country" : "GB" }, "id" : "12345" }

  createEntry(element);

  const contentWithEntry =
    '<div id="result">' +
      '<ul id="locationsList">' +
    '<li id="12345" class="item"><a id="12345" href="/weather?id=12345">London,GB</a></li>' +
      '</ul>' +
    '</div>';

  expect(document.body.innerHTML).toEqual(contentWithEntry);
});
