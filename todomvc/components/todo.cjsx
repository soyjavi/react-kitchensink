module.exports = React.createClass

  getInitialState: ->
    value     : @props.todo.name
    completed : @props.todo.completed
    editing   : false

  # -- Events
  onToggle: (event) ->
    @props.todo.completed = not @props.todo.completed
    @setState completed: @props.todo.completed

  onEdit: (event) ->
    @setState editing: true

  onDestroy: (event) ->
    @props.todo.destroy()

  onFieldKeyDown: (event) ->
    @setState editing: false if event.keyCode is 13

  onChange: (event) ->
    @setState value: event.target.value

  onSubmit: (event) ->
    @props.todo.name = @refs.field.getDOMNode().value

  # -- Render
  render: ->
    classes = ""
    classes += " completed" if @props.todo.completed
    classes += " editing" if @state.editing

    <li className={classes}>
      <div className="view">
        <input className="toggle" type="checkbox"
          checked={@props.todo.completed}
          onChange={@onToggle} />
        <label onDoubleClick={@onEdit}>{@state.value}</label>
        <button className="destroy" onClick={@onDestroy}></button>
      </div>
      <input type="text" className="edit" value={@state.value}
        ref="field"
        onBlur={@onSubmit}
        onChange={@onChange}
        onKeyDown={@onFieldKeyDown} />
    </li>
