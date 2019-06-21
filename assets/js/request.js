import createHTTPClient from './httpCLient';
import { api_key } from './api_key';
import createConnection from './httpClient';
import httpClientWrapper from './httpClientWrapper';

const API_KEY = api_key;
const API_ROOT = 'https://api.openweathermap.org/data/2.5';

const connection = createConnection(httpClientWrapper);

export function url(city) { return `${API_ROOT}/find?q=${city}&APPID=${API_KEY}` };

export default function request(city) {
  const APIUrl = url(city);
  return connection(APIUrl); //returns a promise
};
