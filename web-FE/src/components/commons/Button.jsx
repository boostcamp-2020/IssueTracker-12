import styled from 'styled-components';

const Button = styled.a`
  display: inline-block;
  color: ${props => props.bacgroundColor || '#fff'};
  background-color: ${props => props.bacgroundColor || '#2ea44f'};
  padding: 5px 16px;
  font-size: 14px;
  font-weight: 800;
  white-space: nowrap;
  vertical-align: middle;
  cursor: pointer;
  border-radius: 6px;
  -webkit-appearance: none;
`;

export default Button;
