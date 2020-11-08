import React from "react";

const PageLayout = (props) => {
  return (
    <div>
      {props.header}
      {props.main}
    </div>
  )
}

export default PageLayout;
