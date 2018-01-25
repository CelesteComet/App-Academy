import { RECEIVE_SEARCH_GIPHYS } from '../actions/giphy_actions';


let initialState = [];

const giphysReducer = (state = initialState, action) => {
  // return a new state based on the action's type
  // use action's payload to create that new state

  switch (action.type) {
    case RECEIVE_SEARCH_GIPHYS:
      return action.payload;
    default:
      return state;
  }
}

export default giphysReducer;