"use strict"

ShoppingList = React.createClass
  getInitialState: ->
    items: [
      id: 1, name: 'Apple', qty: 2
    ,
      id: 2, name: 'Orange', qty: 3
    ,
      id: 3, name: 'Chicken', qty: 1
    ]

  render: ->
    <List items={@state.items} onClick={@handleItemClick} />

  handleItemClick: (name, event) ->
    event.preventDefault()
    console.log '12-parent_children_comunication -> click event', name


List = React.createClass
  propTypes:
    items  : React.PropTypes.array.isRequired,
    onClick: React.PropTypes.func.isRequired

  render: ->
    <ul>
      {
        for item, index in @props.items
          <li key={index}>
            <a href="#" onClick={@props.onClick.bind(null, item)}>{item.name}</a>
          </li>
      }
    </ul>


React.render <ShoppingList />, document.getElementById('12-comunication')
