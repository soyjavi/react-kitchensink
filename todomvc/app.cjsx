"use strict"

SPARouter = require "spa-router"
Header  = require "./components/header"
Todo    = require "./components/todo"
Footer  = require "./components/footer"
Task    = require "./models/task"

App = React.createClass

  # -- States & Properties
  getInitialState: ->
    todos   : []
    context : "find"

  # -- Lifecycle
  componentDidMount: ->
    Task.observe (state) => @setState todos: Task.find()
    SPARouter.listen
      '/'          : @setState.bind @, context: "find"
      '/active'    : @setState.bind @, context: "uncompleted"
      '/completed' : @setState.bind @, context: "completed"
    SPARouter.path ""

  # -- Events
  onToggleTodos: (event) ->
    todo.completed = event.target.checked for todo in Task.find()
    @setState todos: Task.find()

  # -- Render
  render: ->
    <div>
      <Header />
      <section className="main">
        <input className="toggle-all" type="checkbox" onClick={@onToggleTodos} />
        <label htmlFor="toggle-all">Mark all as complete</label>
        <ul className="todo-list">
        {
          <Todo key={todo.uid} todo={todo} /> for todo in Task[@state.context]()
        }
        </ul>
      </section>
      <Footer context={@state.context} />
    </div>

React.render <App />, document.getElementsByClassName("todoapp")[0]
