"use strict"

LikeButton = React.createClass

  getInitialState: ->
    liked: false

  handleClick: (event) ->
    @setState liked: not @state.liked

  render: ->
    text = if @state.liked then 'like' else 'haven\'t liked'

    <p onClick={@handleClick}>
      You {text} this. Click to toggle.
    </p>

React.render <LikeButton />, document.getElementById('01-basic')
