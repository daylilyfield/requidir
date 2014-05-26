require 'coffee-script/register'

gulp = require 'gulp'
task = gulp.task.bind gulp
watch = gulp.watch.bind gulp
{src, dest} = gulp

coffee = require 'gulp-coffee'
jasmine = require 'gulp-jasmine'

pipe = require 'pipe-joint'

task 'coffee', -> pipe [
  src 'lib/*.coffee'
  coffee()
  dest 'lib/'
]

task 'test', -> pipe [
  src 'spec/**/*-spec.coffee'
  jasmine()
]

task 'watch', -> watch 'lib/*.coffee', ['coffee']

task 'default', ['coffee']
