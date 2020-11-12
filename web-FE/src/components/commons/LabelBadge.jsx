import React from 'react';
import styled from 'styled-components';

const LabelBadge = (props) => {
  const { name, color, margin } = props;
  return (
    <Badge backgroundColor={color} margin={margin}>{name}</Badge>
  );
};

const Badge = styled.div`
  display: flex;
  color: ${(props) => props.color || '#fff'};
  background-color: ${(props) => props.backgroundColor || '#9a21sf'};
  padding: 3px 10px;
  font-size: 12px;
  font-weight: 600;
  white-space: nowrap;
  vertical-align: middle;
  border-radius: 6px;
  -webkit-appearance: none;
  height:20px;
  align-items:center;
  ${(props) => `margin:${props.margin};`}
`;

export default LabelBadge;
