"use strict"

animalsListData = [
  id: 1, animal: 'tiger', name: 'Vee'
,
  id: 2, animal: 'lion', name: 'Simba'
,
  id: 3, animal: 'dog', name: 'Buck'
,
  id: 4, animal: 'sealion', name: 'Seel'
]


AnimalsList = React.createClass
  getInitialState: ->
    animals: []

  componentDidMount: ->
    @_fetchAsync()

  render: ->
    if @state.animals.length is 0
      <div>
        No animals!
        <br />
        <a href="#fetch" onClick={@handleFetchClick}>Fetch</a>
      </div>
    else
      <div>
        <ul>
          {
            for animal, index in @state.animals
              <li key={index}>{animal.name} the {animal.animal}</li>
          }
        </ul>
        <a href="#reset" onClick={@handleResetClick}>Reset</a>
      </div>

  handleResetClick: (event) ->
    event.preventDefault()
    @setState animals: []

  handleFetchClick: (event) ->
    event.preventDefault()
    @_fetchAsync()

  _fetchAsync: ->
    setTimeout (=> @setState animals: animalsListData), 2000


React.render <AnimalsList />, document.getElementById('08-fetching')
