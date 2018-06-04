import React from 'react'
import { Card, CardTitle, CardText, CardActions, CardMenu, IconButton, Button, Cell } from 'react-mdl'

const InitiativeList = (props) => (
  <Cell col={3}>
    <Card shadow={0} style={{width: '100%', margin: 'auto'}}>
      <CardTitle style={{color: '#fff', height: '176px', background: 'url(http://www.getmdl.io/assets/demos/welcome_card.jpg) center / cover'}}>{props.initiative.title}</CardTitle>
      <CardText>
        <p>{ props.initiative.short_description }</p>
        <p>{ props.initiative.finish_date }</p>
        <p>{ props.initiative.general_sum }</p>
        <p>{ props.initiative.collected_amount }</p>
        <p>{ props.initiative.state }</p>
      </CardText>
      <CardActions border>
        <Button colored>Get Started</Button>
      </CardActions>
    </Card>
  </Cell>
)

export default InitiativeList
