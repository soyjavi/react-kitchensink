"use strict"

LikeComponent = React.createClass

  getInitialState: ->
    response: ''

  render: ->
    style =
      like    : display: if @state.response is 'like' then 'none' else 'block'
      dislike : display: if @state.response is 'like' then 'block' else 'none'

    <div>
      <p>Do you like fish sticks?</p>
      <p>Response: I {@state.response || '_____'} fishsticks.</p>
      <a onClick={@handleLike} style={style.like}>I like it.</a>
      <a onClick={@handleDislike} style={style.dislike}>I dislike it.</a>
    </div>

  handleLike: (event) ->
    event.preventDefault()
    @setState response: 'like'

  handleDislike: (event) ->
    event.preventDefault()
    @setState response: 'dislike'

React.render <LikeComponent />, document.getElementById('06-states')
