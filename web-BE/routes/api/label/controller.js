const labelModel = require('../../../models/label');

const labelController = {
  create: (req, res) => {
    labelModel.insert(req.body);
    res.json({message:"create a label successfully"})
  },
  read: async (req, res) => {
    const labelArr = await labelModel.select();
    res.json({ labelArray : labelArr })
  },
  update: (req, res) => {
    labelModel.update(req.body);
    res.json({message:"update the label successfully"})
  },
  delete: (req, res) => {
    // TODO : 협의필 : labelid 변수명을 쿼리로 받는 것으로 우선 가정하겠습니다.
    labelModel.delete(parseInt(req.query.labelid)); 
  },
};

module.exports = labelController;
