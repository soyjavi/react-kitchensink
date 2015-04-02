"use strict"

App = React.createClass
  render: ->
    <article>
      <SubNavBar />
      <MainContent />
    </article>

SubNavBar = React.createClass
  render: ->
    <nav>
      <a href="#1">link.1</a>
      <a href="#2">link.2</a>
      <a href="#3">link.3</a>
    </nav>

MainContent = React.createClass
  render: ->
    <Grid fluid>
      <Col md={3}>
        <Sidebar/>
      </Col>
      <Col md={9}>
        <Dashboard/>
      </Col>
    </Grid>

Grid = React.createClass
  render: ->
    console.log "09-nested_views -> ", @props.children
    <div>
      {@props.children}
    </div>

Col = React.createClass
  render: -> <div></div>

Sidebar = React.createClass
  render: -> <aside></aside>

Dashboard = React.createClass
  render: -> <article></article>

React.render <App />, document.getElementById('09-nested')
