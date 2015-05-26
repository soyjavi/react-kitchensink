"use strict"

React                 = require "react"

mui                   = require "material-ui"
RaisedButton          = mui.RaisedButton
FloatingActionButton  = mui.FloatingActionButton
AppBar                = mui.AppBar
DatePicker            = mui.DatePicker
DropDownMenu          = mui.DropDownMenu
ThemeManager          = require("material-ui/lib/styles/theme-manager")()
Colors                = require "material-ui/lib/styles/colors"

injectTapEventPlugin = require "react-tap-event-plugin"
injectTapEventPlugin()

Example = React.createClass

  childContextTypes:
    muiTheme: React.PropTypes.object

  getChildContext: ->
    muiTheme: ThemeManager.getCurrentTheme()

  # componentWillMount: ->
  #   ThemeManager.setPalette
  #     accent1Color: Colors.deepOrange500

  onMenu: (event) ->
    alert ">>>"

  onLeftIconButtonTouchTap: ->
    alert "?"

  render: ->
    menuItems = [
      payload: '1', text: 'Never'
    ,
      payload: '2', text: 'Every Night'
    ,
      payload: '3', text: 'Weeknights'
    ,
      payload: '4', text: 'Weekends'
    ,
      payload: '5', text: 'Weekly'
   ]


    <div>
      <AppBar title='Title' iconClassNameRight="muidocs-icon-navigation-expand-more"/>
      <RaisedButton label="Primary" secondary={true}>
      </RaisedButton>
      <FloatingActionButton iconClassName="muidocs-icon-custom-github"/>
      <DatePicker hintText="Landscape Dialog"/>

      <DropDownMenu menuItems={menuItems} />
    </div>

React.render <Example />, document.body
