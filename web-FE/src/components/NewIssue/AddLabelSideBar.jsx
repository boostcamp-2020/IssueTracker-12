import React, { useState, useContext } from 'react';
import styled from 'styled-components';
import { ReactComponent as GearIcon } from '@Images/gear.svg';
import { LabelContext } from '@Stores/LabelStore';
import LabelSelector from './LabelSelector';
import LabelBadge from '@Components/commons/LabelBadge';

const AddLabelSideBar = ({
  selectedLabels,
  setSelectedLabels
}) => {
  const { labelState } = useContext(LabelContext);
  const getLabelObjectById = (labelId) => labelState.find((label) => label.label_id === labelId);
  return (
    <Div>
      <FlexColumn>
        <LabelSelector
          selected={selectedLabels}
          setSelected={setSelectedLabels}
          labelState={labelState}
        />
        <GearIcon
          width="16px"
          height="16px"
        />
      </FlexColumn>
      <Item>
        {
          selectedLabels.length !== 0
            ? selectedLabels.map((labelId) => {
              const label = getLabelObjectById(labelId);
              return (
                <LabelBadge
                  key={labelId}
                  name={label.label_name}
                  color={label.color}
                  margin="0 5px 5px 0"
                />
              );
            })
            : ('No label')
        }
      </Item>
    </Div>
  )
}

const FlexColumn = styled.div`
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: 10px;
`;

const Item = styled.div`
  display: flex;
  flex-wrap: wrap;
  padding: 10px 10px;
  width: 100%;
  box-sizing:border-box;
  font-size: 14px;
`;

const Div = styled.div`
  width: 100%;
  min-height: 60px;
  padding: 20px;
  border-bottom: 1px solid lightgrey;
  box-sizing:border-box;
`;

export default AddLabelSideBar;
