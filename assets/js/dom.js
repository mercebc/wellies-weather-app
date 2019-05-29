const getCity = () => document.getElementById("city").value;

const clearResults = () => removeElement('locationsList');

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

const createList = () => {
  const parent = getElement('result');
  const ul = addElement('ul', 'locationsList', parent);
}

const createEntry = (element) => {
  const parent = getElement('locationsList');
  const li = addElement('li', element.id, parent);
  li.setAttribute('class','item');

  const link = addElement("a", element.id, li);
  link.innerHTML = element.name + "," + element.sys.country;
  link.href = '/weather?id=' + element.id;
}

export { createList, createEntry, clearResults, getCity };
