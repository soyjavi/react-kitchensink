"use strict"

# -- DEPENDENCIES --------------------------------------------------------------
gulp    = require "gulp"
cjsx    = require "gulp-cjsx"
concat  = require "gulp-concat"
connect = require 'gulp-connect'
gutil   = require "gulp-util"
uglify  = require "gulp-uglify"
pkg     = require "./package.json"

# -- FILES ---------------------------------------------------------------------
path =
  build     :   "./build"
  exercises :   "exercises/*.cjsx"
  todomvc   : [ "todomvc/entities/*.coffee"
                "todomvc/components/app.*.cjsx"
                "todomvc/components/app.cjsx"]

banner = [
  "/**"
  " * <%= pkg.name %> - <%= pkg.description %>"
  " * @version v<%= pkg.version %>"
  " * @link    <%= pkg.homepage %>"
  " * @author  <%= pkg.author.name %> (<%= pkg.author.site %>)"
  " * @license <%= pkg.license %>"
  " */"
  ""
].join("\n")

# -- TASKS ---------------------------------------------------------------------
gulp.task "webserver", ->
  connect.server
    port      : 8000
    livereload: true

gulp.task "exercises", ->
  gulp.src path.exercises
    .pipe cjsx().on "error", gutil.log
    .pipe gulp.dest path.build
    .pipe uglify mangle: true
    .pipe connect.reload()

gulp.task "todomvc", ->
  gulp.src path.todomvc
    .pipe concat "todomvc.cjsx"
    .pipe cjsx().on "error", gutil.log
    .pipe gulp.dest path.build
    # .pipe uglify mangle: true
    .pipe connect.reload()

gulp.task "init", ["exercises", "todomvc"]

gulp.task "default", ->
  gulp.run ["webserver"]
  gulp.watch path.exercises, ["exercises"]
  gulp.watch path.todomvc, ["todomvc"]
