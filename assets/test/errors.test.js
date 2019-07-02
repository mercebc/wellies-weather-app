import * as React from 'react';
import * as ReactDOM from 'react-dom'
import { shallow } from 'enzyme';

import { NotFound, ServerError } from '../js/errors';

test('renders NotFound component', () => {
  const notFound = shallow(<NotFound />);

  expect(notFound.text()).toEqual('City not found');
});

test('renders ServerError component', () => {
  const serverError = shallow(<ServerError />);

  expect(serverError.text()).toEqual('Server is not responding, try in a few minutes');
});
