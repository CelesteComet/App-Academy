const selectCurrency = (b, r) => {
  return {
    type: "SWITCH_CURRENCY",
    b,
    r
  }
}

export const SELECT_CURRENCY = "SELECT_CURRENCY";

export default selectCurrency;