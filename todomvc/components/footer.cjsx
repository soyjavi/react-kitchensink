Task = require "../models/task"

module.exports = React.createClass

  # -- States & Properties
  getInitialState: ->
    uncompleted : 0

  # -- Lifecycle
  componentDidMount: ->
    Task.observe (state) =>
      @setState uncompleted: Task.uncompleted().length

  # -- Events
  onClearCompleted: (event) ->
    event.preventDefault()
    todo.destroy() for todo in Task.completed()

  # -- Render
  render: ->
    cx = React.addons.classSet
    context = @props.context

    <footer className="footer">
      <span className="todo-count"><strong>{@state.uncompleted}</strong> item left</span>
      <ul className="filters">
        <li>
          <a className={cx selected: context is 'find'} href="#/">All</a>
        </li>
        <li>
          <a className={cx selected: context is 'uncompleted'} href="#/active">Active</a>
        </li>
        <li>
          <a className={cx selected: context is 'completed'} href="#/completed">Completed</a>
        </li>
      </ul>
      <button className="clear-completed" onClick={@onClearCompleted}>Clear completed</button>
    </footer>
