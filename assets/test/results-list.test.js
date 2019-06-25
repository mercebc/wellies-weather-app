import * as React from 'react';
import * as ReactDOM from 'react-dom'
import { mount } from 'enzyme';

import { ResultsTitle, ResultsList, SingleResult } from '../js/results-list';

test('renders the results title for London search', () => {
  const results = mount(<ResultsTitle city={'London'} />);

  expect(results.text()).toEqual('Results for London');
});

test('renders a single result for London,CA with id', () => {
  const results = mount(<SingleResult city={'London'} id={'123'} country={'CA'} />);
  const singleResult = results.find('a');

  expect(singleResult.text()).toEqual('London, CA');
  expect(singleResult.prop('id')).toEqual('123');
});

test('renders a single result with href', () => {
  const results = mount(<SingleResult city={'London'} id={'123'} country={'CA'} />);
  const singleResult = results.find('a');

  expect(singleResult.prop('href')).toEqual('/weather?id=123');
});

test('renders the list of results', () => {
  const locations = {"count":1,"list": [ {"id":2643743,"name":"London","sys":{"country":"GB"}} ]};

  const results = mount(<ResultsList locations={locations}/>);
  const singleResult = results.find('a').first().text();

  expect(singleResult).toEqual('London, GB');
});

