import css from "../css/app.css"

import "phoenix_html"

import { render } from "./locations"

import * as React from 'react'
import * as ReactDOM from 'react-dom'

const search = document.getElementById("search")

if (search) {
  search.onclick = render;
}
