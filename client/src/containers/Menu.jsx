import React from 'react';
import { Link } from 'react-router';

function Menu(props) {
  return (
    <div>
      <a href="/"> Home </a>
      <Link to="/initiatives">
        Initiatives
      </Link>
    </div>
  );
};

export default Menu;
