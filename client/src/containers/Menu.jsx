import React from 'react'
import { Link } from 'react-router-dom'
import { Layout, Header, Navigation } from 'react-mdl'

const Menu = (props) => (
  <div style={{height: '300px', position: 'relative'}}>
    <Layout style={{background: 'url(http://www.getmdl.io/assets/demos/transparent.jpg) center / cover'}}>
      <Header transparent>
        <Navigation>
          <Link to="/">
            Home
          </Link>
          <Link to="/initiatives">
            Initiatives
          </Link>
        </Navigation>
      </Header>
    </Layout>
  </div>
)

export default Menu;
