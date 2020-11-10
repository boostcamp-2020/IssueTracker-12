import React, { useState, useEffect, useCallback, useRef } from 'react';
import styled from 'styled-components';
import DropdownModal from './DropdownModal';

const Dropdown = ({ className, title, list }) => {
  const [isOpen, setIsOpen] = useState(false);
  const dropdownRef = useRef();

  const onDropdownClicked = (event) => {
    event.preventDefault();
    setIsOpen(!isOpen);
  };

  const pageClickEvent = useCallback(({ target }) => {
    const { current } = dropdownRef;
    if (!current.contains(target)) {
      setIsOpen(!isOpen);
    }
  }, [isOpen]);

  useEffect(() => {
    if (isOpen) {
      window.addEventListener('click', pageClickEvent);
    }

    return () => {
      window.removeEventListener('click', pageClickEvent);
    };
  }, [isOpen, pageClickEvent]);

  return (
    <details
      ref={dropdownRef}
      className={className}
      open={isOpen}
    >
      <DropdownButton onClick={onDropdownClicked}>
        {title}
        <DropdownImage />
      </DropdownButton>
      <DropdownModal list={list} />
    </details>
  );
};

const DropdownButton = styled.summary`
  position: relative;
  cursor: pointer;

  &::-webkit-details-marker {
    display: none;
  }
`;

const DropdownImage = styled.span`
  display: inline-block;
  width: 0;
  height: 0;
  vertical-align: middle;
  content: "";
  border-top-style: solid;
  border-top-width: 4px;
  border-right: 4px solid transparent;
  border-bottom: 0 solid transparent;
  border-left: 4px solid transparent;
  margin-left: 3px;
`;

export default Dropdown;
