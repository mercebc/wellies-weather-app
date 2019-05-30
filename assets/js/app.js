import css from "../css/app.css"

import "phoenix_html"

import { render } from "./locations"

const search = document.getElementById("search")

if (search) {
  search.onclick = render;
}
