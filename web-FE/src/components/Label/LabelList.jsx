import React, { useEffect } from "react";
import { getLabels } from "@Api/label";

const App = () => {
  useEffect(async () => {
    const labelArray = await getLabels();
    console.log(labelArray);
    const labels = labelArray.map((label) => (
      <li key={label.label_id}> {label.label_name} </li>
    ));
    console.log(labels, "??");
    return <ul>{labels}</ul>;
  });

  return (
    <div>
      <h1>TEST</h1>
    </div>
  );
};

export default App;
