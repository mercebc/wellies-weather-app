import * as React from 'react'
import * as ReactDOM from 'react-dom'

function ResultsTitle(props){
    return(
      <p className="results-title">Results for {props.value}</p>
    );
}
export default ResultsTitle;
