"use strict"

Greeter = React.createClass

  mixins: [React.addons.PureRenderMixin]

  getInitialState: ->
    greeting: '11-pure_render -> Hi'

  componentDidUpdate: ->
    console.log '11-pure_render -> Component updated!'

  render: ->
    console.log '11-pure_render -> Component rendered!'
    <div>
      Greeting: {@state.greeting}
      <br />
      <hr />
      <a href="#" onClick={@handleClick.bind(null, 'Hi')}>Say Hi</a>
      <br />
      <a href="#" onClick={@handleClick.bind(null, 'Hey')}>Say Hey</a>
    </div>

  handleClick: (greeting, event) ->
    event.preventDefault()
    console.log '11-pure_render -> click event', greeting
    @setState greeting: greeting

React.render <Greeter />, document.getElementById('11-pure')
