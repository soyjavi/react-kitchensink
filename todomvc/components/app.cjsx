"use strict"

App = App or {}

App.TodoMVC = React.createClass

  # -- States & Properties
  getInitialState: ->
    todos   : []
    context : "find"

  # -- Lifecycle
  componentDidMount: ->
    App.Entity.observe (state) => @setState todos: App.Entity.find()
    router = Router
      '/'          : @setState.bind @, context: "find"
      '/active'    : @setState.bind @, context: "uncompleted"
      '/completed' : @setState.bind @, context: "completed"
    router.init '/'

  # -- Events
  onToggleTodos: (event) ->
    todo.completed = event.target.checked for todo in App.Entity.find()
    @setState todos: App.Entity.find()

  # -- Render
  render: ->
    <div>
      <App.Header />
      <section className="main">
        <input className="toggle-all" type="checkbox" onClick={@onToggleTodos} />
        <label htmlFor="toggle-all">Mark all as complete</label>
        <ul className="todo-list">
        {
          <App.Todo key={todo.uid} todo={todo} /> for todo in App.Entity[@state.context]()
        }
        </ul>
      </section>
      <App.Footer context={@state.context} />
    </div>

React.render <App.TodoMVC />, document.getElementsByClassName("todoapp")[0]
