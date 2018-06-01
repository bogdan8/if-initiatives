import * as types from './actionTypes';

export function allInitiatives() {
  return function (dispatch) {
    return initiativeApi.getInitiatives().then(response => {
      dispatch({
        type: types.GET_INITIATIVES,
        initiatives: response.body
      });
    }).catch(error => {
      throw(error);
    });
  };
};
