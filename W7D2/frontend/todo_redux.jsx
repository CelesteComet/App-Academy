import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';

import Root from './components/root';

document.addEventListener('DOMContentLoaded', () => {
  const preloadedState = localStorage.state ?
    JSON.parse(localStorage.state) : {};
  const store = configureStore(preloadedState);

  store.dispatch = applyMiddlewares(store, [addLoggingToDispatch]);

  const root = document.getElementById('content');
  ReactDOM.render(<Root store={store} />, root);
});

// const addLoggingToDispatch = (store) => {
//   let storeDispatch = store.dispatch;

//   return function(action) {
//     console.log('old state', store.getState());
//     console.log('action', action);
//     storeDispatch(action);
//     console.log('new state', store.getState());
//   }
// }

function addLoggingToDispatch(store) {
  return function (next) {
    return function (action) {
      console.log('old state', store.getState());
      console.log('action', action);
      storeDispatch(action);
      console.log('new state', store.getState());
      next(action);
    };
  };
};



const applyMiddlewares = (store, middlewares) => {
  let dispatch = store.dispatch;

  middlewares.forEach(middleware => {
    dispatch = middleware(store)(dispatch);
  })


}