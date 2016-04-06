gulp = require 'gulp'
browser  = require "browser-sync"
config = require '../config'

gulp.task "server", ->
  browser {
    server:
      baseDir: "./build"
  }
