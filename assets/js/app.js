import css from "../css/app.css"

import "phoenix_html"

import { renderLocationResults } from "./locations"

document.getElementById("search").onclick = renderLocationResults;
