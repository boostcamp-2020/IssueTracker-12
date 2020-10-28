const labelModel = require('../../../models/label')

const labelController = {
    create : (req, res)=>{
        labelModel.insert()
    },
    read : async (req, res)=>{
        labelModel.select()
    },
    update : (req,res)=>{
        labelModel.update()
    },
    delete : (req, res)=>{
        labelModel.delete()
    }
}

module.exports = labelController 