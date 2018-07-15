import React, { Component } from 'react'
import { Provider } from 'react-redux'
import { createStore, applyMiddleware } from 'redux'
import thunk from 'redux-thunk'
import { composeWithDevTools } from 'redux-devtools-extension'

import Routes from '../routes/Routes.jsx'
import rootReducer from '../reducers/rootReducer'

import 'react-mdl/extra/material.js'

import '../style/Header.sass'

const store = createStore(rootReducer, composeWithDevTools(applyMiddleware(thunk)))

export default class App extends Component {
  render() {
    return (
      <Provider store={store}>
        <Routes />
      </Provider>
    )
  }
}
