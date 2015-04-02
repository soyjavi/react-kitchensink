"use strict"

LikeList = React.createClass
  render: ->
    return (
      <ul>
        <LikeListItem text='turtles.' />
      </ul>
    )


LikeListItem = React.createClass
  propTypes:
    text: React.PropTypes.string.isRequired

  getDefaultProps: ->
    description: 'N/A'

  render: ->
    <li>
      {this.props.text} - {this.props.description}
    </li>

React.render(<LikeList />, document.getElementById('list'));
