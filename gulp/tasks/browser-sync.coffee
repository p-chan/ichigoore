gulp = require 'gulp'
browser  = require "browser-sync"
config = require '../config'

gulp.task "server", ['browserify'], ->
  browser {
    server:
      baseDir: "./build"
    open: false
  }
