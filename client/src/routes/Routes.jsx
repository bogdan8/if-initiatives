import React, { Component } from 'react';
import { connect } from 'react-redux';
import { BrowserRouter as Router, Route } from 'react-router';

import { Main, Initiatives } from '../components';

export default class Routes extends Component {
  render() {
    return (
      <Router>
        <Route path="/" component={ Main }>
          <Route path="/initiatives" component={ Initiatives }/>
        </Route>
      </Router>
    );
  };
};
