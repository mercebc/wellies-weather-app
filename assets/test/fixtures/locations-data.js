const locations = {
  message: 'accurate',
  cod: '200',
  count: 5,
  list:
  [{
    id: 2643743,
    name: 'London',
    sys: { country: 'GB' },
  },
  {
    id: 6058560,
    name: 'London',
    sys: { country: 'CA' },
  },
  {
    id: 4517009,
    name: 'London',
    sys: { country: 'US' },
  },
  {
    id: 4298960,
    name: 'London',
    sys: { country: 'US' },
  },
  {
    id: 5016884,
    name: 'London',
    sys: { country: 'US' },
  }
  ],
};

const notFound = {
  message: 'accurate',
  cod: '200',
  count: 0,
  list:[],
};

export { locations, notFound };
