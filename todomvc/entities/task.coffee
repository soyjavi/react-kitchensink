"use strict"

App = App or {}

class App.Entity extends Hamsa

  @define
    name         : type: String
    completed    : type: Boolean, default: false
    created_at   : type: Date, default: new Date()

  @completed: -> @find (todo) -> todo if todo.completed

  @uncompleted: -> @find (todo) -> todo if not todo.completed
