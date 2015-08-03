"use strict"

# -- DEPENDENCIES --------------------------------------------------------------
gulp          = require "gulp"
cjsx          = require "gulp-cjsx"
concat        = require "gulp-concat"
connect       = require 'gulp-connect'
gutil         = require "gulp-util"
header        = require "gulp-header"
stylus        = require "gulp-stylus"
less          = require "gulp-less"
uglify        = require "gulp-uglify"
pkg           = require "./package.json"
browserify    = require "browserify"
source        = require "vinyl-source-stream"
# -- FILES ---------------------------------------------------------------------
path =
  build       : "./build"
  exercises   : "exercises/*.cjsx"
  style       : [ "material-ui/styles/theme.less"]

# -- COPYRIGHT -----------------------------------------------------------------
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
gulp.task "server", ->
  connect.server
    port      : 8000
    livereload: true

gulp.task "exercises", ->
  gulp.src path.exercises
    .pipe cjsx().on "error", gutil.log
    .pipe gulp.dest path.build
    .pipe uglify mangle: true
    .pipe connect.reload()

gulp.task "init", ["exercises"]

gulp.task "default", ->
  gulp.run ["server"]
  gulp.watch path.exercises, ["exercises"]
