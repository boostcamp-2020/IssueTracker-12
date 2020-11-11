import React, { useContext } from 'react';
import styled from 'styled-components';
import { LabelContext } from '@Stores/LabelStore';
import LabelListHeader from './LabelListHeader';
import LabelListItem from './LabelListItem';

const LabelListBoard = () => {
  const { labelState, dispatch } = useContext(LabelContext);
  return (
    <Board>
      <LabelListHeader />
      {labelState.map((label) => {
        const { label_id: labelId } = label;
        return (<LabelListItem label={label} key={labelId} dispatch={dispatch}/>);
      })}
    </Board>
  );
};

const Board = styled.div`
  display:flex;
  flex-direction: column;
  margin: 30px 40px 0 40px;
  align-items: stretch;
  width: 100%;
`;

export default LabelListBoard;
