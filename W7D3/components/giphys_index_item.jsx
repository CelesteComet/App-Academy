import React from 'react';

const GiphysIndexItem = (props) => {
  let gif = props.gif;
  
  return (
    <li>
      <img src={gif.images.fixed_height.url} />
    </li>
  );
}

export default GiphysIndexItem;