import { getLocations, renderResult, render} from '../js/locations';

jest.mock('../js/request');
jest.mock('../js/api_key');

test('renders the input field', () => {

  document.body.innerHTML =
    '';

  const renderedElements =
    '<div class="flex">'+
      '<input class="margin-small" type="text" placeholder="Search..." id="city" value="">' +
    '</div>';

  render().then(() => {
    return expect(document.body.innerHTML).toEqual(renderedElements);
  })
  .catch(function(error) {
    console.log(error);
  });
});
