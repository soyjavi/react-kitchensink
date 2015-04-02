"use strict"

LikeButton = React.createClass

  getInitialState: ->
    liked: false

  render: ->
    text = if @state.liked then 'like' else 'haven\'t liked'

    <p onClick={@handleClick}>
      You {text} this. Click to toggle.
    </p>

  handleClick: (event) ->
    @setState liked: not @state.liked

React.render <LikeButton />, document.getElementById('01-basic')
