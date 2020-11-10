import React from 'react';
import styled from 'styled-components';

const LabelBadge = (props) => {
  const { name, color } = props;
  return (
    <Badge backgroundColor={color}>{name}</Badge>
  );
};

const Badge = styled.div`
  display: inline-block;
  color: ${(props) => props.color || '#fff'};
  background-color: ${(props) => props.backgroundColor || '#9a21sf'};
  padding: 3px 10px;
  font-size: 12px;
  font-weight: 600;
  white-space: nowrap;
  vertical-align: middle;
  border-radius: 6px;
  -webkit-appearance: none;
`;

export default LabelBadge;
