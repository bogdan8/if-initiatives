import React, { Component } from 'react';
import { browserHistory } from 'react-router';
import { Menu } from '../components';

export default class Main extends Component {
  constructor(props) {
    super(props);
  };

  componentWillMount() {
    browserHistory.push('/initiatives')
  }

  render() {
    return (
      <div>
        <div className="body">
          <Menu/>
          { this.props.children }
        </div>
      </div>
    )
  }
}

