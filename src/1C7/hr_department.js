'use strict'

const fullFileName = require('../helper/fullFileName')
const Target = require('../Target')
const makeFile = require('./Target1C7')

// Be attentive to fill this section
const Entity = require('../entity/Department') 
const SOURCE_FILE_NAME = 'PDR.DBF'
const TARGET_FILE_NAME = 'Підрозділи (hr_department).csv'

function makeTarget(config, dictionary) {
    let target = new Target.Target()
    target.fullFileName = fullFileName(config.targetPath, TARGET_FILE_NAME)
    target.sourceFullFileName = fullFileName(config.c1DbPath, SOURCE_FILE_NAME)
    target.dictionary = dictionary
    target.entity = new Entity()
    target.entity.setRecord = setRecord
    return makeFile(target)
}

function setRecord(record, recordNumber) {
    this.ID = recordNumber
    this.code = record.ID
    this.name = record.NM
    this.parentUnitID = record.ID_PARENT ? this.dictionary.get_DepartmentID(record.ID_PARENT) : ''
    this.fullName = record.NMF
    this.description = department.name + ' (' + department.code + ')'
    this.dateFrom = dateFormat(record.BEG)
    this.dateTo = dateFormat(record.END)
    this.dictionary.set_payElID(this.entity.code, this.entity.ID)
}

module.exports = makeTarget
