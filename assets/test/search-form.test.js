import * as React from 'react';
import * as ReactDOM from 'react-dom'
import { shallow, mount, render } from 'enzyme';

import SearchForm from '../js/search-form';
import ResultsTitle from '../js/results-list';
const ReactTestRenderer = require('react-test-renderer');

test('renders the input field with placeholder', () => {
  const testInstance = ReactTestRenderer.create(
    <SearchForm />
  ).root;

  expect(testInstance.findByType('input').props.placeholder).toBe("Search...");
});

test('renders the search button', () => {
  const testInstance = ReactTestRenderer.create(
    <SearchForm />
  ).root;

  expect(testInstance.findByType('button').children).toEqual(['Search']);
});

test('submits a form with London input', () => {
    const searchQuery = 'London';
    const onSearchSubmit = jest.fn();

    const locationsInstance = shallow(<SearchForm />);
  console.log(locationsInstance);

    const formInstance = locationsInstance.findByType('form');
    expect(formInstance).toBeDefined();

    const eventMock = { preventDefault: jest.fn() };
    formInstance.props.onSubmit(eventMock);

    expect(onSearchSubmit).toHaveBeenCalledTimes(1);
    expect(onSearchSubmit).toHaveBeenCalledWith(searchQuery);
});

test('shows results title for London', () => {
    const searchQuery = 'London';

    const locationsInstance = ReactTestRenderer.create((
      <SearchForm value={searchQuery} />
    )).root;

    const formInstance = locationsInstance.findByType('form');
    formInstance.props.onSubmit();

    const resultsInstance = locationsInstance.findByType(ResultsTitle);
    expect(resultsInstance.findByProps({className: "results-title"}).children).toEqual(['Results for London']);
});
