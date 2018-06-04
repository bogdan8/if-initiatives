import React, { Component } from 'react'
import { connect } from 'react-redux'
import { BrowserRouter as Router, Route } from 'react-router-dom'

import Menu from '../containers/Menu.jsx'
import Main from '../containers/Main.jsx'
import Initiatives from '../containers/Initiatives.jsx'

export default class Routes extends Component {
  render() {
    return (
      <Router>
        <div>
          <Menu/>
          <Route exact path="/" component={ Main } />
          <Route path="/initiatives" component={ Initiatives } />
        </div>
      </Router>
    )
  }
}
