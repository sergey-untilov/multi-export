'use strict'

const path = require('path')

const FILE_CREATED = 'created'
const FILE_ERROR = 'error'
const FILE_EMPTY = 'empty'

class Target {
    constructor() {
        this.fileName = null
        this.state = null
        this.err = null
        this.recordsCount = 0
    }
}

module.exports = {
    Target,

    FILE_CREATED,
    FILE_ERROR,
    FILE_EMPTY,
}
