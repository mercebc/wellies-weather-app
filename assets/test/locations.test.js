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
