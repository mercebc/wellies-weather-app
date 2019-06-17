import * as React from 'react';
import * as ReactDOM from 'react-dom'

import Locations from '../js/locations';
const ReactTestRenderer = require('react-test-renderer');

test('renders the input field with placeholder', () => {
  const testInstance = ReactTestRenderer.create(
    <Locations />
  ).root;

  expect(testInstance.findByType('input').props.placeholder).toBe("Search...");
});

test('renders the banner', () => {
  const testInstance = ReactTestRenderer.create(
    <Locations />
  ).root;

  expect(testInstance.findByProps({className: "wellies-banner"}).children).toEqual(['Find out if you are going to need wellies in your town!']);
});
