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
  build : "./build"
  cjsx  : "exercises/*.cjsx"

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

gulp.task "cjsx", ->
  gulp.src path.cjsx
    # .pipe concat "site.coffee"
    .pipe cjsx().on "error", gutil.log
    .pipe gulp.dest path.build
    # .pipe uglify mangle: true
    .pipe connect.reload()

gulp.task "init", ["cjsx"]

gulp.task "default", ->
  gulp.run ["webserver"]
  gulp.watch path.cjsx, ["cjsx"]
