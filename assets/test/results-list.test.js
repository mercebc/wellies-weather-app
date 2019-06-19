import * as React from 'react';
import * as ReactDOM from 'react-dom'

import ResultsTitle from '../js/search-form';
const ReactTestRenderer = require('react-test-renderer');

test('renders the results title for London search', () => {
  const resultsInstance = ReactTestRenderer.create(
    <ResultsTitle value="London" />
  ).root;

  expect(resultsInstance.findByProps({className: "results-title"}).children).toEqual(['Results for London']);
});
