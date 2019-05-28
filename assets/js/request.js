const request = (url) => {
  return fetch(url)
    .then(res => res.json())
    .then(myJson => JSON.stringify(myJson));
};

export default request;
