import React from "react";
import { BrowserRouter, Route, Switch } from "react-router-dom";
import Home from "@Components/Home";
import Login from "@Components/Login";
import Label from "@Components/Label";
import IssueListPage from "@Components/Issue";

const App = () => {
  return (
    <BrowserRouter>
      <Switch>
        <Route path="/login" component={Login} />
        <Route path="/label" component={Label} />
        <Route exact path="/issue" component={IssueListPage} />
        <Route path="/" component={Home} />
      </Switch>
    </BrowserRouter>
  );
};

export default App;
