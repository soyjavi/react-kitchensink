"use strict"

urls = [
  href: "tapquo.com", name: "tapquo"
,
  href: "google.com", name: "google"
,
  href: "facebook.com", name: "facebook"
]

Links = React.createClass

  render: ->
    console.log urls
    <div>
      {
        for url, index in urls
          <a href="http://{url.href}" onClick={@handleClick.bind(null, url.name)}>{url.name}</a>
      }
    </div>

  handleClick: (name, event) ->
    event.preventDefault()
    alert 'You clicked ' + name

React.render <Links />, document.getElementById('02-bind')
