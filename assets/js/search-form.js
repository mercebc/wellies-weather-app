import * as React from 'react'
import * as ReactDOM from 'react-dom'

import { ResultsTitle, ResultsList } from '../js/results-list';
import { NotFound, ServerError } from '../js/errors';
import request from '../js/request'

export default class SearchForm extends React.Component{
  constructor(props) {
    super(props);
    this.state = {
      city: "",
      resultsError: null,
      resultsList: null,
    }
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

  getLocations(){
    return request(this.state.city)
      .then(result => this.setState({resultsList: result}))
      .then(result => this.setState({resultsError: false}))
      .catch(error => this.setState({resultsError: true}))
  }

  resultsList(){
    if(this.state.resultsError){
        return <ServerError/>
    }else if (this.state.resultsList != null){
      if(this.state.resultsList.count > 0) {
        return <ResultsList locations={this.state.resultsList}></ResultsList>
      }else{
        return <NotFound/>
      };
    }
  }

  resultsTitle(){
    if (this.state.resultsError == false){
      return <ResultsTitle city={this.state.city}></ResultsTitle>;
    }
  }

  render(){
    return(
      <section>
        <form className="flex" onSubmit={(event) => {this.handleResult(event)}}>
          <input
            className="margin-small"
            type="text"
            placeholder="Search..."
            id="city"
            value={this.state.city}
            onChange={(event) => {this.handleCity(event)}}
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

