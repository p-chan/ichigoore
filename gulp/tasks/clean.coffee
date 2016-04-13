gulp = require 'gulp'
del = require　'del'
config = require '../config'


gulp.task 'clean', ->
  del(config.build.root)
