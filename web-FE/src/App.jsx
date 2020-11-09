import React from "react";
import { BrowserRouter, Route } from "react-router-dom";
import Home from "./components/Home/index";
import Login from "./components/Login/Index";
import Label from "./components/Label/Index";

const App = () => {
  return (
    <BrowserRouter>
      <Route path="/" component={Home} />
      <Route path="/login" component={Login} />
      <Route path="/label" component={Label} />
    </BrowserRouter>
  );
};

export default App;
