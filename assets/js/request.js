const API_ROOT = 'https://api.openweathermap.org/data/2.5';

function url(city, apiKey) { return `${API_ROOT}/find?q=${city}&APPID=${apiKey}` };

export function createHttpClient(client, apiKey) {
  return {
    searchCity: function(city) {
      const APIUrl = url(city, apiKey);
      return client(APIUrl)
        .then(res => res.json())
        .catch(error => console.log(error))
    },
  }
}
