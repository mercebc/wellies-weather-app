import request from './request';
import { api_key } from "./api_key"

const API_KEY = api_key;
const API_ROOT = 'https://api.openweathermap.org/data/2.5';

const url = (city) => `${API_ROOT}/find?q=${city}&APPID=${API_KEY}`;

const getLocations = (city) => {
  const APIUrl = url(city);
  return request(APIUrl);
}

const renderLocationResults = () => {
  const city = document.getElementById("city").value;

  getLocations(city)
    .then(result => document.getElementById("result").innerHTML = result)
}

export { getLocations, renderLocationResults };
