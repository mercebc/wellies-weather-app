import * as React from 'react';
import * as ReactDOM from 'react-dom';
import fetch from 'node-fetch';
import { apiKey } from './api-key';

import { SearchForm } from './search-form';
import { createHttpClient } from './request';

const httpClient = createHttpClient(fetch, apiKey)

export function Locations(props){
  return (
    <div className="container">
      <section className="phx-hero">
        <p className="wellies-banner">Find out if you are going to need wellies in your town!</p>
      </section>
      <SearchForm httpClient={httpClient} />
    </div>
  )
}
