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

  const event = {target: {value: searchQuery}}
  wrapper.find('input').at(0).simulate('change', event)
  const form = wrapper.find('form');
  form.simulate('submit');


  console.log(wrapper.update().debug())

  const resultsTitle = wrapper.update().find('.results-title');
  expect(resultsTitle.text()).toEqual('Results for London');
});

test('shows results list for London', () => {
  const searchQuery = 'London';
  const wrapper = mount(<SearchForm />);
  const event = {target: {value: searchQuery}}
  wrapper.find('input').at(0).simulate('change', event)
  const form = wrapper.find('form');
  form.simulate('submit');
  const resultsList = wrapper.find('#locationsList');
  const singleResult = resultsList.find('a').first().text();

  expect(singleResult).toEqual('London, GB');
});

test('shows not city found banner', () => {
  const searchQuery = 'Londonsdkfjhs';
  const wrapper = mount(<SearchForm />);
  const event = {target: {value: searchQuery}}
  wrapper.find('input').at(0).simulate('change', event)
  const form = wrapper.find('form');
  form.simulate('submit');
  const notFound = wrapper.find('#notFound');

  expect(notFound.text()).toEqual('City not found');
});
