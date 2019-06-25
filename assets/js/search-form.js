import * as React from 'react'
import * as ReactDOM from 'react-dom'

import { ResultsTitle, ResultsList } from '../js/results-list';
import { NotFound, ServerError } from '../js/errors';

export class SearchForm extends React.Component{
  constructor(props) {
    super(props);
    this.state = {
      city: "",
      resultsError: false,
      resultsList: [],
    }
    this.handleCity = this.handleCity.bind(this);
    this.handleResult = this.handleResult.bind(this);
  }

  handleCity(event){
    this.setState({
      city: event.target.value
    })
  }

  handleResult(event){
    event.preventDefault();
    this.getLocations()
  }

  getLocations() {
    return this.props.httpClient.searchCity(this.state.city)
      .then(result => this.setState({resultsList: result, resultsError: false}))
      .catch(error => this.setState({resultsError: true}))
  }

  resultsList() {
    if (this.state.resultsError) {
      return <ServerError/>
    } else if (this.state.resultsList.length !== 0){
      if(this.state.resultsList.count > 0) {
        return <ResultsList locations={this.state.resultsList}></ResultsList>
      } else {
        return <NotFound/>
      };
    }
  }

  resultsTitle(){
    if (this.state.resultsList.length !== 0){
      return <ResultsTitle city={this.state.city}></ResultsTitle>;
    }
  }

  render(){
    return(
      <section>
        <form className="flex" onSubmit={this.handleResult}>
          <input
            required
            className="margin-small"
            type="text"
            placeholder="Search..."
            id="city"
            value={this.state.city}
            onChange={this.handleCity}
          />
          <button
            type='submit'
            id='search'
          >Search</button>
        </form>
        {this.resultsTitle()}
        {this.resultsList()}
      </section>
    )
  }
}

