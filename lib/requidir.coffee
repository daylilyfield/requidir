path = require 'path'
fs = require 'fs'

cache = {}

module.exports = (dir, callback = (m) -> m) ->
  raise 'argument "dir" is required' unless dir
  return callback cache[dir] if dir of cache

  caller = findCaller()
  cwd = path.dirname(caller)
  target = path.resolve(cwd, dir)

  mod = cache[dir] = fs.readdirSync(target).filter (file) ->
    file[0] isnt '.' and fs.statSync(path.join(target, file)).isFile()
  .reduce (container, file) ->
    name = file.replace path.extname(file), ''
    container[name] = require path.join(target, file)
    container
  , {}

  callback mod

raise = (message) -> throw new Error(message)
  
findCaller = ->
  original = Error.prepareStackTrace
  Error.prepareStackTrace = (error, stack) -> stack
  error = new Error
  stack = error.stack
  Error.prepareStackTrace = original
  stack[2].getFileName()
