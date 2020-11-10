import React from "react";
import { BrowserRouter, Route, Switch } from "react-router-dom";
import Home from "./components/Home/Index";
import Login from "./components/Login/Index";
import Label from "./components/Label/Index";
import IssueListPage from "@Components/Issue";

const App = () => {
  return (
    <BrowserRouter>
      <Route path="/" component={Home} />
      <Route path="/login" component={Login} />
      <Route path="/label" component={Label} />
      <Switch>
        <Route exact path="/" component={IssueListPage} />
      </Switch>
    </BrowserRouter>
  )
}

export default App;
