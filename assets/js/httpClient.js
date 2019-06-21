function createConnection(httpClientWrapper) {
 return (url) => {
  return httpClientWrapper(url)
    .then(res => { const t = res.json()
    console.log(t)
    return t})
    .catch(error => console.log(error))
 }
}

export default createConnection;
