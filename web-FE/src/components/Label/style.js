import styled from 'styled-components';

export const EditLabelFormStyle = {
  MainContainer: styled.div`
    display: ${(props) => props.display};
    flex-direction: column;
    align-items: center;
    align-items: flex-start;
    width: 98%;
    border: 0;
    border-top: 1px solid #e1e4e8;
  `,
  BadgeContainer: styled.div`
  margin: 10px 0 0 15px;
  `,

}
