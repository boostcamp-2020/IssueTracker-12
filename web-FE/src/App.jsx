import React from "react";
import { BrowserRouter, Route } from "react-router-dom";
import Home from "./pages/Home";
import Login from "./pages/Login";

const App = () => {
  return (
    <BrowserRouter>
      <h1>HELL no world</h1>
      <Route path="/" exact={true} component={Home} />
      <Route path="/login" exact={true} component={Login} />
    </BrowserRouter>
  );
};

export default App;
