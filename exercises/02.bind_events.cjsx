"use strict"

Links = React.createClass

  render: ->
    <div>
      <a href="http://google.com" onClick={@handleClick.bind(null, 'Google')}>Google</a>
      <a href="http://facebook.com" onClick={@handleClick.bind(null, 'Facebook')}>Facebook</a>
    </div>

  handleClick: (name, event) ->
    event.preventDefault()
    alert 'You clicked ' + name

React.render <Links />, document.getElementById('02-bind')
