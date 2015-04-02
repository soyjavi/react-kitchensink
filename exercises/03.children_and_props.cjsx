"use strict"

LikeList = React.createClass
  render: ->
    <ul>
      <LikeListItem text='turtles' />
      <LikeListItem text='birds' description='unknown' className='complete' />
      <LikeListItem />
    </ul>


LikeListItem = React.createClass
  propTypes:
    text        : React.PropTypes.string.isRequired
    description : React.PropTypes.string

  getDefaultProps: ->
    description: 'N/A'

  render: ->
    <li className={@props.className} >
      {@props.text} - {@props.description}
    </li>

React.render <LikeList />, document.getElementById('03-children')
