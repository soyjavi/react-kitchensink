"use strict"

Likes = React.createClass
  render: ->
    <div>
      <LikesListWrapper>
        <LikeListItem text="turtles" />
      </LikesListWrapper>
    </div>


# Parent Component (wrapper)
LikesListWrapper = React.createClass
  render: ->
    <ul>
      { @props.children }
      <div></div>
    </ul>

# Child Component
LikeListItem = React.createClass
  render: ->
    <li>{@props.text}</li>

React.render <Likes />, document.getElementById('05-parent')
