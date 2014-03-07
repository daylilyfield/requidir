requidir = require '../lib/requidir.coffee'

describe 'requidir', ->

  it 'should load modules in a specified directory', ->
    target1 = requidir './target1'
    expect(target1.module1).toBeDefined()
    expect(target1.module1.name).toEqual 'module1'
    expect(target1.module2).toBeDefined()
    expect(target1.module2.name).toEqual 'module2'

  it 'should resolve relative path', ->
    lib = requidir '../lib'
    expect(lib.requidir).toBeDefined()
