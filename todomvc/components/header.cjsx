
Task = require "../models/task"

module.exports = React.createClass

  # -- Events
  onKeyDown: (event) ->
    if event.keyCode is 13
      event.preventDefault()
      el = @refs.input.getDOMNode()
      new Task name: el.value.trim()
      el.value = ""

  # -- Render
  render: ->
    <header className="header">
      <h1>todos</h1>
      <input ref="input" className="new-todo" placeholder="What needs to be done?" autofocus onKeyDown={@onKeyDown}/>
    </header>
