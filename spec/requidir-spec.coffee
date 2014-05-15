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

  it 'should cache modules', ->
    first = requidir './target2'
    second = requidir './target2'
    expect(first).toBe second

  it 'should throw error in case of missing argument "dir"', ->
    expect(-> requidir()).toThrow new Error('argument "dir" is required')

  it 'should throw error if argument "dir" is empty', ->
    expect(-> requidir('')).toThrow new Error('argument "dir" is required')

  it 'should throw error if argument "dir" is not a directory', ->
    expect(-> requidir('../hoge')).toThrow()

  it 'should apply callback', ->
    called = 0
    target3 = requidir './target3', (m) ->
      called++
      m
    expect(called).toBe 2
    expect(target3.module4).toBeDefined()
    expect(target3.module4.name).toBe 'module4'
    expect(target3.module5).toBeDefined()
    expect(target3.module5.name).toBe 'module5'
