import * as React from 'react'
import * as ReactDOM from 'react-dom'

export function ResultsTitle(props){
  return(
    <p className="results-title">Results for {props.city}</p>
  );
}

export function SingleResult(props){
  return(
    <li className="item">
      <a id={props.id} href={`/weather?id=${props.id}`}>{props.city}, {props.country}</a>
    </li>
  );
}

export class ResultsList extends React.Component{
  constructor(props) {
    super(props);
  }

  createResultList(locations) {
    const cities = locations.list;
    return (cities.map(city => (
      <SingleResult
        key={city.id}
        id={city.id}
        city={city.name}
        country={city.sys.country}
      />
    ))
    );
  }

  render() {
    return(
      <section>
        <ul id="locationsList">
          {this.createResultList(this.props.locations)}
        </ul>
      </section>
    )
  };
}
