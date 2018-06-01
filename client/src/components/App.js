import React from 'react';
import PropTypes from 'prop-types';
import { Provider } from 'react-redux';
import { createStore, applyMiddleware } from 'redux';
import thunk from 'redux-thunk';
import Routes from '../routes/Routes.jsx';
import rootReducer from '../reducers/rootReducer';

const store = createStore(rootReducer, applyMiddleware(thunk));

const App = ({ store }) => {
  <Provider store={store}>
    <Routes />
  </Provider>
}

App.propTypes = {
  store: PropTypes.object.isRequired
}

export default App;
