path = require 'path'
fs = require 'fs'

cache = {}

module.exports = (dir) ->
  throw new Error('argument "directory" is required') unless dir
  return cache[dir] if dir of cache

  caller = findCaller()
  cwd = path.dirname caller
  target = path.resolve cwd, dir

  cache[dir] = fs.readdirSync(target).filter (file) ->
    fs.statSync(path.join(target, file)).isFile()
  .reduce (container, file) ->
    name = file.replace path.extname(file), ''
    container[name] = require path.join(target, file)
    container
  , {}

findCaller = ->
  origPrepareStackTrace = Error.prepareStackTrace
  Error.prepareStackTrace = (error, stack) -> stack
  error = new Error
  stack = error.stack
  Error.prepareStackTrace = origPrepareStackTrace
  stack[2].getFileName()
