"use strict"

LikeButton = React.createClass

  componentWillMount: ->
    console.log "07-lifecycle -> componentWillMount"

  componentDidMount: ->
    console.log "07-lifecycle -> componentDidMount"

  componentWillReceiveProps: (next_props) ->
    console.log "07-lifecycle -> componentWillReceiveProps -> ", next_props

  componentWillUpdate: (next_props, next_states) ->
    console.log "07-lifecycle -> componentWillUpdate -> ", next_props, next_states

  componentDidUpdate: (prev_props, prev_states) ->
    console.log "07-lifecycle -> componentDidUpdate -> ", prev_props, prev_states

  componentWillUnmount: ->
    console.log "07-lifecycle -> componentWillUnmount"

  shouldComponentUpdate: (next_props, next_states) ->
    console.log "07-lifecycle -> shouldComponentUpdate -> ", next_props, next_states
    return true

  getInitialState: ->
    liked: false

  handleToggle: (event) ->
    @setState liked: not @state.liked

  handleDestroy: (event) ->
    React.unmountComponentAtNode @getDOMNode().parentNode

  render: ->
    text = if @state.liked then 'like' else 'haven\'t liked'
    <p>
      You {text} this.
      <button onClick={@handleToggle}>Click to toggle.</button>
      <button onClick={@handleDestroy}>Destroy</button>
    </p>

React.render <LikeButton />, document.getElementById('07-lifecycle')
