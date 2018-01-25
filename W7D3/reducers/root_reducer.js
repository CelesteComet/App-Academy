import { combineReducers } from 'redux';

import giphysReducer from './giphys_reducer';

let combined = combineReducers({
  giphys: giphysReducer
});


export default combined;