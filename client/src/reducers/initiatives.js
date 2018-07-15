import {
  GET_INITIATIVES
} from '../actions/actionTypes'

export default function initiatives(state = [], action) {
  switch (action.type) {
  case GET_INITIATIVES:
    return action.initiatives
  default:
    return state
  }
}

