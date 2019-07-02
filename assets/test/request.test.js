import * as React from 'react';
import * as ReactDOM from 'react-dom';
import { createHttpClient } from '../js/request';
import { locations } from './fixtures/locations-data'

const locationsResponse = {
  json() {
    return Promise.resolve(locations);
  },
};

test('builds the correct url', () => {
  const apiKey = 'merce';
  const city = 'London';
  const mock = jest.fn().mockResolvedValue(locationsResponse);
  const httpClient = createHttpClient(mock, apiKey);

  httpClient.searchCity(city);

  expect(mock).toHaveBeenCalledWith('https://api.openweathermap.org/data/2.5/find?q=London&APPID=merce');
});

test('gets locations from the api', (done) => {
  const mock = jest.fn().mockResolvedValue(locationsResponse);
  const httpClient = createHttpClient(mock, 'key');

  httpClient.searchCity('London').then(
    (res) => { expect(res.list.length).toEqual(5);
               done();
    }
  )
});
