"use strict"

App = App or {}

App.Footer = React.createClass

  # -- States & Properties
  getInitialState: ->
    uncompleted : 0


  # -- Lifecycle
  componentDidMount: ->
    App.Entity.observe (state) =>
      @setState uncompleted: App.Entity.uncompleted().length


  # -- Events
  onClearCompleted: (event) ->
    event.preventDefault()
    todo.destroy() for todo in App.Entity.completed()


  # -- Render
  render: ->
    <footer className="footer">
      <span className="todo-count"><strong>{@state.uncompleted}</strong> item left</span>
      <ul className="filters">
        <li>
          <a className="selected" href="#/">All</a>
        </li>
        <li>
          <a href="#/active">Active</a>
        </li>
        <li>
          <a href="#/completed">Completed</a>
        </li>
      </ul>
      <button className="clear-completed" onClick={@onClearCompleted}>Clear completed</button>
    </footer>
