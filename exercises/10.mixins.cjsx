"use strict"

Mixin1 =
  componentWillMount: ->
    console.log "10-mixins -> componentWillMount 1/1"

  componentDidMount: ->
    console.log "10-mixins -> 1/3"

Mixin2 =
  componentDidMount: ->
    console.log "10-mixins -> 2/3"

Greeter = React.createClass
  mixins: [Mixin2]

  componentDidMount: ->
    console.log "10-mixins -> 3/3 -> component did mount!"

  render: ->
    <div>Hi!</div>

React.render <Greeter />, document.getElementById('10-mixins')
