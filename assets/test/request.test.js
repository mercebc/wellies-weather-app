import * as React from 'react';
import * as ReactDOM from 'react-dom'
import { request, url} from '../js/request';

jest.mock('../js/httpClientWrapper');
jest.mock('../js/api_key');

test("gets the url for London", () => {
  const city = "London"

  expect(url(city)).toEqual("https://api.openweathermap.org/data/2.5/find?q=London&APPID=1234");
});

test("gets number of locations for London", (done) => {
  const city = "London"

  request(city).then(res => {
    expect(res.count).toEqual(5)
    done()
  })
});

test("gets zero locations if city not found", (done) => {
  const city = "Londsdfs"

  request(city).then(res => {
    expect(res.count).toEqual(0)
    done()
  })
});
