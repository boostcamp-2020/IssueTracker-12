import React from "react";
import { BrowserRouter, Route, Switch } from "react-router-dom";
import IssueListPage from "@Pages/Issue";
import NewIssuePage from "@Pages/NewIssuePage";

const App = () => {
  return (
    <BrowserRouter>
      <Switch>
        <Route exact path="/" component={IssueListPage} />
        <Route path="/issue/new" component={NewIssuePage} />

      </Switch>
    </BrowserRouter>
  )
}

export default App;
