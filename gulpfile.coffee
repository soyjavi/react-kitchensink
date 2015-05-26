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
  todomvc     : [ "todomvc/**/*.cjsx"
                  "todomvc/**/*.coffee"]
  material_ui : [ "material-ui/**/*.cjsx"
                  "material-ui/**/*.coffee"]
  style       : [ "material-ui/styles/theme.less"]

# -- BROWSERIFY ----------------------------------------------------------------
bundle_todomvc = browserify "./todomvc/app.cjsx", extensions: [".cjsx", ".coffee"]
bundle_todomvc.transform require "coffee-reactify"
bundle_material_ui = browserify "./material-ui/app.cjsx", extensions: [".cjsx", ".coffee"]
bundle_material_ui.transform require "coffee-reactify"
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

gulp.task "material-ui", ->
  bundle_material_ui.bundle()
    .on "error", gutil.log.bind(gutil, "Browserify Error")
    .pipe source "material-ui.js"
    # .pipe uglify mangle: true
    .pipe header banner, pkg: pkg
    .pipe gulp.dest path.build
    .pipe connect.reload()

gulp.task "material-ui-style", ->
  gulp.src path.style
    .pipe concat "material-ui.less"
    .pipe less()
    # .pipe stylus
    #   compress: true
    #   errors  : true
    .pipe header banner, pkg: pkg
    .pipe gulp.dest path.build
    .pipe connect.reload()

gulp.task "todomvc", ->
  bundle_todomvc.bundle()
    .on "error", gutil.log.bind(gutil, "Browserify Error")
    .pipe source "todomvc.js"
    # .pipe uglify mangle: true
    .pipe header banner, pkg: pkg
    .pipe gulp.dest path.build
    .pipe connect.reload()

gulp.task "init", ["exercises", "todomvc", "material-ui", "material-ui-style"]

gulp.task "default", ->
  gulp.run ["server"]
  gulp.watch path.exercises, ["exercises"]
  gulp.watch path.todomvc, ["todomvc"]
  gulp.watch path.material_ui, ["material-ui"]
  gulp.watch path.style, ["material-ui-style"]
