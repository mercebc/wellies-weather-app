import * as React from 'react';
import * as ReactDOM from 'react-dom'

import { Locations } from '../js/locations';
const ReactTestRenderer = require('react-test-renderer');

test('render correctly Locations component', () => {
  const locations = ReactTestRenderer.create(
    <Locations />
  ).root;

  expect(locations).toMatchSnapshot();
});

test('renders the banner', () => {
  const testInstance = ReactTestRenderer.create(
    <Locations />
  ).root;

  expect(testInstance.findByProps({className: "wellies-banner"}).children).toEqual(['Find out if you are going to need wellies in your town!']);
});
