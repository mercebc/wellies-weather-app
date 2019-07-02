import * as React from 'react';
import * as ReactDOM from 'react-dom'
import { mount, shallow } from 'enzyme';

import { ResultsTitle, ResultsList, SingleResult } from '../js/results-list';

test('renders the results title for London search', () => {
  const results = shallow(<ResultsTitle city={'London'} />);

  expect(results.text()).toEqual('Results for London');
});

test('renders the list of results', () => {
  const locations = {"count":2,"list": [ {"id":2643743,"name":"London","sys":{"country":"GB"}}, {"id":3468453,"name":"London","sys":{"country":"CA"}} ]};

  const results = mount(<ResultsList locations={locations}/>);
  const resultsLength = results.find('a').length;

  expect(resultsLength).toEqual(2);
});

