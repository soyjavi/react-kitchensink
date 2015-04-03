"use strict"

App = App or {}

App.Header = React.createClass

  # -- Events
  onKeyDown: (event) ->
    if event.keyCode is 13
      event.preventDefault()
      el = @refs.input.getDOMNode()
      new App.Entity name: el.value.trim()
      el.value = ""

  # -- Render
  render: ->
    <header className="header">
      <h1>todos</h1>
      <input ref="input" className="new-todo" placeholder="What needs to be done?" autofocus onKeyDown={@onKeyDown}/>
    </header>
