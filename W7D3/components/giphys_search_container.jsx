import { connect } from 'react-redux';
import GiphysSearch from './giphys_search';
import { fetchSearchGiphys } from '../actions/giphy_actions';

const mapDispatchToProps = (dispatch) => {
  return {
    fetchGiphys: function(searchTerm) {
      dispatch(fetchSearchGiphys(searchTerm))
    }
  }
};

const mapStateToProps = (state) => {
  return {
    giphys: state.giphys
  };
};

let giphySearchContainer = connect(mapStateToProps, mapDispatchToProps)(GiphysSearch);

export default giphySearchContainer;




