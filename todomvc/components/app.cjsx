"use strict"

App = App or {}

App.TodoMVC = React.createClass

  # -- States & Properties
  getInitialState: ->
    todos: []


  # -- Lifecycle
  componentDidMount: ->
    App.Entity.observe (state) =>
      console.log "[OBSERVE.#{state.type}]"
      @setState todos: App.Entity.find()

    new App.Entity name: "Task nº#{index}" for index in [1..5]


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
          <App.Todo key={todo.uid} todo={todo} /> for todo in App.Entity.find()
        }
        </ul>
      </section>
      <App.Footer />
    </div>

React.render <App.TodoMVC />, document.getElementsByClassName("todoapp")[0]
