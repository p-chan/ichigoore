gulp = require 'gulp'
sass = require 'gulp-sass'
bourbon = require 'node-bourbon'
autoprefixer = require 'gulp-autoprefixer'
config = require '../config'

bourbon.with config.source.stylesheets

gulp.task 'sass', ->
  gulp.src [
      config.source.stylesheets + '**/*.scss'
      '!' + config.source.stylesheets + '**/_*.scss'
    ]
    .pipe sass {includePaths: bourbon.includePaths}
    .pipe autoprefixer(
      browsers: [ 'last 2 versions' ]
      cascade: false
    )
    .pipe gulp.dest config.build.stylesheets
