import * as React from 'react'
import * as ReactDOM from 'react-dom'

export default class Locations extends React.Component{
  constructor() {
    super();
    this.state = {
      city: ""
    }
  }

  handleCity = (input) => {
    this.setState({
      city: input
    })
  }

  render() {
    return (
      <div className="container">
        <section className="phx-hero">
          <p className="wellies-banner">Find out if you are going to need wellies in your town!</p>
        </section>
        <div className="flex">
          <input
            className="margin-small"
            type="text"
            placeholder="Search..."
            id="city"
            value=""
            onChange={(input) => this.handleCity(input)}
          />
          <button type='button' id='search'>Search</button>
        </div>
      </div>
    )
  }
}
