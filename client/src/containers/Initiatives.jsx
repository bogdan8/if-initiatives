import React, { Component } from 'react';
import { connect } from 'react-redux';
import { bindActionCreators } from 'redux';

import * as initiativeAction from '../actions/initiativeActions';

class Initiatives extends Component {
  componentWillMount() {
    this.props.actions.allInitiatives();
  };

  render() {
    const { initiatives } = this.props;
    
    return (
      <div>
        {initiatives}
      </div>
    )
  };
};

function mapStateToProps(state) {
  return {
    initiatives: state.initiatives
  }
}

function mapDispatchToProps(dispatch) {
  return {
    actions: bindActionCreators({...initiativeActions}, dispatch)
  };
};

export default connect(mapStateToProps, mapDispatchToProps)(Initiatives);
