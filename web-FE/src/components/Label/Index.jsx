import React from "react";
import styled from "styled-components";
import LabelMilestoneTag from "../common/LabelMilestoneTag";
import NewLabelButton from "./NewLabelButton";
import LabelList from "./LabelList";

const App = () => {
  const Div = styled.div`
    border: 1px solid grey;
    padding: 20px;
  `;

  const TagButtons = styled.div`
    display: flex;
    justify-content: space-between;
  `;

  return (
    <Div>
      <TagButtons>
        <LabelMilestoneTag />
        <NewLabelButton />
      </TagButtons>
      <LabelList />
    </Div>
  );
};

export default App;
