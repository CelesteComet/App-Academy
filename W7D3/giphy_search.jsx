import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';
import Root from './components/root';
import { fetchSearchGiphys } from './util/api_util'
import { receiveSearchGiphys } from './actions/giphy_actions'


let store = configureStore();

document.addEventListener("DOMContentLoaded", () => {

  let root = $('#root')[0];

  ReactDOM.render(<Root store={store} />, root);

})

