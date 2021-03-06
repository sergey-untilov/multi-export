'use strict'

const getFullFileName = require('../helper/getFullFileName')
const Target = require('../Target')
const makeFile = require('./Target1C7')

// Be attentive to fill this section
const Entity = require('../entity/SimpleEntity')
const SOURCE_FILE_NAME = 'KAD.DBF'
const TARGET_FILE_NAME = 'Категорії персоналу (hr_dictStaffCat).csv'

function setRecord(record, recordNumber) {
    this.entity.ID = recordNumber
    this.entity.code = record.CD
    this.entity.name = record.NM
    this.entity.description = `${this.entity.name} (${this.entity.code})`
    this.dictionary.setDictStaffCatID(this.entity.code, this.entity.ID)
    let catID = this.entity.ID
    let schedID = this.dictionary.getWorkScheduleID(record.GRF)
    this.dictionary.setDictStaffCatID_WorkScheduleID(catID, schedID)
    return true
}

function makeTarget(config, dictionary) {
    let target = new Target.Target()
    target.fullFileName = getFullFileName(config.targetPath, TARGET_FILE_NAME)
    target.sourcegetFullFileName = getFullFileName(config.c1DbPath, SOURCE_FILE_NAME)
    target.dictionary = dictionary
    target.entity = new Entity()
    target.setRecord = setRecord
    return makeFile(target)
}

module.exports = makeTarget
