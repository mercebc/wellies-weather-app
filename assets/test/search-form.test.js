import * as React from 'react';
import * as ReactDOM from 'react-dom'
import { shallow, mount, render } from 'enzyme';

import SearchForm from '../js/search-form';
import { ResultsTitle } from '../js/results-list';
import ReactTestRenderer from 'react-test-renderer';

jest.mock('../js/httpClientWrapper');
jest.mock('../js/api_key');

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

test('shows results title for London', () => {
  const searchQuery = 'London';

  const wrapper = mount(<SearchForm />);

  const form = wrapper.find('form');
  form.simulate('submit');

  const event = {target: {value: searchQuery}}
  wrapper.find('input').at(0).simulate('change', event)

  console.log(event)

  const resultsTitle = wrapper.find('ResultsTitle');
  expect(resultsTitle.text()).toEqual('Results for London');
});


