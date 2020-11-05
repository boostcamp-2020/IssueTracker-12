import React from "react";
import { BrowserRouter, Route } from "react-router-dom";
import Home from "./pages/Home";

const App = () => {
  return (
    <BrowserRouter>
      <h1>HELL no world</h1>
      <Route path="/" exact={true} component={Home} />
    </BrowserRouter>
  );
};

export default App;