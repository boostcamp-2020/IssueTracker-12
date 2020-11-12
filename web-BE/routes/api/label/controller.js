const labelModel = require("../../../models/label");

const labelController = {
  create: async (req, res) => {
    const { label_name, description, color } = req.body;
    const labelId = await labelModel.insert(label_name, description, color);
    res.status(200).json(labelId);
  },
  read: async (req, res) => {
    const labelArr = await labelModel.select();
    res.status(200).json({ labelArray: labelArr });
  },
  update: (req, res) => {
    const { name: label_name, description, color } = req.body;
    labelModel.update([name, description, color, +req.params.labelid]);
    res.status(200).json({ message: "update the label successfully" });
  },
  delete: (req, res) => {
    labelModel.delete(+req.params.labelid);
    res.status(200).json({ message: "delete the label successfully" });
  },
};

module.exports = labelController;
