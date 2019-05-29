import request from './request';
import { api_key } from "./api_key";
import { createList, createEntry, clearResults, getCity } from "./dom";

const API_KEY = api_key;
const API_ROOT = 'https://api.openweathermap.org/data/2.5';

const url = (city) => `${API_ROOT}/find?q=${city}&APPID=${API_KEY}`;

const getLocations = (city) => {
  const APIUrl = url(city);
  return request(APIUrl);
}

const renderResult = (result) => {
  createList();
  const locations = result.list
  locations.forEach(createEntry);
}

const render = () => {
  clearResults();

  const city = getCity();
  getLocations(city)
    .then(result => renderResult(result))
}

export { getLocations, renderResult, render };
