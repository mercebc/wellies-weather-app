import * as React from 'react'
import * as ReactDOM from 'react-dom'

export default class Locations extends React.Component{

  render() {
    return (
      <div class="flex">
        <input
          class="margin-small"
          type="text"
          placeholder="Search..."
          id="city"
          value=""
        />
      </div>
    )
  }
}
