gulp = require 'gulp'
sass = require 'gulp-sass'
bourbon = require 'node-bourbon'
config = require '../config'

bourbon.with config.source.stylesheets

gulp.task 'sass', ->
  gulp.src [
      config.source.stylesheets + '**/*.scss'
      '!' + config.source.stylesheets + '**/_*.scss'
    ]
    .pipe sass {includePaths: bourbon.includePaths}
    .pipe gulp.dest config.build.stylesheets
