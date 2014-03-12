gulp = require 'gulp'
coffee = require 'gulp-coffee'

gulp.task 'coffee', ->
  gulp.src 'lib/*.coffee'
      .pipe coffee()
      .pipe gulp.dest 'lib/'

gulp.task 'watch', ->
  gulp.watch 'lib/*.coffee', ['coffee']
  return

gulp.task 'default', ['coffee']
