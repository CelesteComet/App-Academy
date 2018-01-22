const initialState = {
  baseCurrency: "Please select",
  rates: {}
};

const reducer = (state = initialState, action) => {
  console.log(action.type);
  switch(action.type) {
    case 'SWITCH_CURRENCY':
      return Object.assign({}, state, {
        baseCurrency: action.b,
        rates: action.r
      })
      break;
    default:
      return state;
  }
};

export default reducer;
