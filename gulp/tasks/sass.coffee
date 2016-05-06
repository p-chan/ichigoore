gulp = require 'gulp'
sass = require 'gulp-sass'
bourbon = require 'node-bourbon'
autoprefixer = require 'gulp-autoprefixer'
bulkSass = require 'gulp-sass-bulk-import'
csso = require 'gulp-csso'
newer = require 'gulp-newer'
browserSync = require 'browser-sync'
plumber = require 'gulp-plumber'
notify = require 'gulp-notify'

config = require '../config'

bourbon.with config.source.stylesheets

gulp.task 'sass', ->
  gulp.src [
      config.source.stylesheets + '**/*.scss'
      '!' + config.source.stylesheets + '**/_*.scss'
    ]
    .pipe plumber({errorHandler: notify.onError("Error: <%= error.message %>")})
    .pipe newer(config.build.stylesheets)
    .pipe bulkSass()
    .pipe sass
      includePaths: [
        bourbon.includePaths,
        './node_modules/../'
      ]
    .pipe autoprefixer(
      browsers: [ 'last 2 versions' ]
      cascade: false
    )
    .pipe csso()
    .pipe gulp.dest config.build.stylesheets
    .pipe browserSync.reload({stream: true})
