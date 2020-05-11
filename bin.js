#!/usr/bin/env node
'use strict'

/** @type {typeof import("./source/bin.coffee") } */
module.exports = require('editions').requirePackage(__dirname, require, 'bin.js')
