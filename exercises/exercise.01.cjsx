"use strict"

LikeButton = React.createClass

  getInitialState: ->
    liked: false

  handleClick: (event) ->
    @setState liked: !@state.liked

  render: ->
    text = @state.liked ? 'like' : 'haven\'t liked'

    <p onClick={@handleClick}>
      You {text} @ Click to toggle.
    </p>

React.render <LikeButton />, document.getElementById('container')
