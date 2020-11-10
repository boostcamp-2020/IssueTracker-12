import React from "react";
import { BrowserRouter, Route, Switch } from "react-router-dom";
import IssueListPage from "@Components/Issue";

const App = () => {
  return (
    <BrowserRouter>
      <Switch>
        <Route exact path="/" component={IssueListPage} />

      </Switch>
    </BrowserRouter>
  )
}

export default App;
