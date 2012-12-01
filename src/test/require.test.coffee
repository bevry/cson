joe = require 'joe'
CSON = require "#{__dirname}/../lib/cson"
assert = require 'assert'

joe.describe 'require', (describe, it) ->
  it 'should load using require', (done) ->
    csonDat = JSON.stringify require '../../test/src/1.cson'
    jsonDat = JSON.stringify require '../../test/out-expected/1.json'
    assert.equal csonDat, jsonDat
    done()
