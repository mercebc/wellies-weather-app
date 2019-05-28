import { getLocations } from '../js/locations';

jest.mock('../js/request');

test('the data is peanut butter', () => {
  return expect(getLocations('London')).resolves.toBe('peanut butter');
});

test('the fetch fails with an error', () => {
  return expect(getLocations('London')).rejects.toMatch('Not found');
});
