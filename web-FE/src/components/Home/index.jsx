import React, { useEffect } from "react";

const App = () => {
  useEffect(async () => {
    const token = await localStorage.getItem(token);
    if (!token) {
      location.href = "/login";
      return;
    }
    location.href = "/issue";
    return;
  });
  return <h1>HELL no world</h1>;
};

export default App;
