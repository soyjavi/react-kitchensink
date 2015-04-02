"use strict"

"use strict"

LikeList = React.createClass

  componentDidMount: ->
    console.log "04-references -> ref.first -> ", @refs.first.getDOMNode()

  render: ->
    <ul>
      <LikeListItem text='turtles' ref='first' />
    </ul>


LikeListItem = React.createClass
  render: ->
    <li>{@props.text}</li>

React.render <LikeList />, document.getElementById('04-references')
