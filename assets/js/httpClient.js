function createConnection(httpClientWrapper) {
 return (url) => {
  return httpClientWrapper(url)
    .then(res => res.json())
    .catch(error => console.log(error))
 }
}

export default createConnection;
