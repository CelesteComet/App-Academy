import React from 'react';

import GiphysIndexItem from './giphys_index_item';

function GiphysIndex({giyphs}) {
  console.log(giyphs)
  return (
    <ul>
      {giyphs.map(gif => {
        return <GiphysIndexItem gif={gif} />
      })}
    </ul>
  );
}



export default GiphysIndex;