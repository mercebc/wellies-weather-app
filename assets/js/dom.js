const getCity = () => document.getElementById("city").value;

const clearResults = () => removeElement('resultsWrapper');

const getElement = (id) => document.getElementById(id);

const removeElement = (elementId) => {
  const element = document.getElementById(elementId);
  element.parentNode.removeChild(element);
}

const addElement = (element, elementId, parent) => {
  const el = document.createElement(element);
  el.setAttribute('id',elementId);
  parent.appendChild(el);
  return el;
}

const wrapper = () => {
  const parent = getElement('result');
  return addElement('div', 'resultsWrapper', parent);
}

const createAlert = (message, id) => {
  const p = addElement('p', id, wrapper());
  p.innerHTML = message
}

const createNotFoundMessage = () => createAlert("City not found", "notFound");

const createServerErrorMessage = () => createAlert("Server is not responding, try in a few minutes", "serverError");

const createList = () => {
  const ul = addElement('ul', 'locationsList', wrapper());
}

const createEntry = (element) => {
  const parent = getElement('locationsList');
  const li = addElement('li', element.id, parent);
  li.setAttribute('class','item');

  const link = addElement("a", element.id, li);
  link.innerHTML = element.name + "," + element.sys.country;
  link.href = '/weather?id=' + element.id;
}

export { createList, createEntry, clearResults, getCity, createNotFoundMessage, createServerErrorMessage };
