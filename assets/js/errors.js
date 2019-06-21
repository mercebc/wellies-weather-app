import * as React from 'react'
import * as ReactDOM from 'react-dom'

export function NotFound(props){
    return(
      <p id="notFound">City not found</p>
    );
}

export function ServerError(props){
    return(
      <p id="serverError">Server is not responding, try in a few minutes</p>
    );
}
