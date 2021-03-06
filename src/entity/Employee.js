'use strict'

const Entity = require('./Entity')

class Employee extends Entity{
    constructor() {
        super()
        this.ID = 0
        this.name = ''
        this.lastName = ''
        this.firstName = ''
        this.middleName = ''
        this.shortFIO = ''
        this.fullFIO = ''
        this.genName = ''
        this.datName = ''
        this.tabNum = 0
        this.sexType = ''
        this.birthDate = ''
        this.taxCode = ''
        this.email = ''
        this.description = ''
        this.locName = ''
        this.dayBirthDate = ''
        this.monthBirthDate = ''
        this.yearBirthDate = ''
    }
}

module.exports = Employee