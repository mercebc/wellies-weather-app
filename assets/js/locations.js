import * as React from 'react'
import * as ReactDOM from 'react-dom'

import SearchForm from './search-form'
import request from './request'

export default function Locations(props){
    return (
      <div className="container">
        <section className="phx-hero">
          <p className="wellies-banner">Find out if you are going to need wellies in your town!</p>
        </section>
        <SearchForm request={request} />
      </div>
    )
}
