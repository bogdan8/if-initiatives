import React, { Component } from 'react'
import { connect } from 'react-redux'
import { bindActionCreators } from 'redux'
import InitiativeList from '../components/InitiativeList.jsx'
import { Grid } from 'react-mdl'

import * as initiativeActions from '../actions/initiativeActions'

class Initiatives extends Component {
  componentWillMount() {
    this.props.actions.allInitiatives();
  }

  shouldComponentUpdate(nextProps, nextState) {
    return (JSON.stringify(nextProps.initiatives) != JSON.stringify(this.props.initiatives))
  }

  render() {
    const { initiatives } = this.props;
    const listInitiatives = initiatives.map((initiative, index) => {
      return <InitiativeList initiative={initiative} key={index} />
    }) 
    
    return <Grid>
      { listInitiatives }
    </Grid>
  }
}

function mapStateToProps(state) {
  return {
    initiatives: state.initiatives
  }
}

function mapDispatchToProps(dispatch) {
  return {
    actions: bindActionCreators({...initiativeActions}, dispatch)
  }
}

export default connect(mapStateToProps, mapDispatchToProps)(Initiatives);
