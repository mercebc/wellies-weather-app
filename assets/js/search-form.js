import * as React from 'react'
import * as ReactDOM from 'react-dom'
import ResultsTitle from '../js/results-list';

export default class SearchForm extends React.Component{
  constructor(props) {
    super(props);
    this.state = {
      city: "",
      isSubmitted: false
    }
  }

  handleCity = (event) => {
    console.log(this);
    this.setState({
      city: event.target.value
    })
  }

  handleResult = (event) => {
    event.preventDefault();
    this.setState({
      isSubmitted: true
    })
  }

  render(){
    let resultsTitle = null;

    if (this.state.isSubmitted){
      resultsTitle = (
        <ResultsTitle value={this.state.city}></ResultsTitle>
      );
    }

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
        {resultsTitle}
      </section>
    )
  }
}

