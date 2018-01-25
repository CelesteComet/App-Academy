import * as APIUtil from '../util/api_util';

export const RECEIVE_SEARCH_GIPHYS = "RECEIVE_SEARCH_GIPHYS";

export const receiveSearchGiphys = (giphys) => {
  return {
    type: RECEIVE_SEARCH_GIPHYS,
    payload: giphys
  };
};


export const fetchSearchGiphys = (searchTerm) => {
  return function(dispatch) {
    APIUtil.fetchSearchGiphys(searchTerm)
      .then(res => {
        dispatch(receiveSearchGiphys(res.data));
      })
  }
}
