const milestoneModel = require('../../../models/milestone');

const milestoneController = {
  create: async (req, res) => {
    const { title, due_date: dueDate, content } = req.body;
    try {
      const insertInfo = [title, dueDate, content];
      const insertId = await milestoneModel.insert(insertInfo);
      res
        .status(200)
        .json({ message: '마일스톤 생성 완료', insertId });
    } catch (err) {
      res.status(500).json(err);
    }
  },
  read: async (req, res) => {
    try {
      const milestoneArr = await milestoneModel.select();
      res
        .status(200)
        .json({ message: '마일스톤 읽기 성공', MilestoneArray: milestoneArr });
    } catch (err) {
      res.status(500).json(err);
    }
  },
  update: (req, res) => {
    const { title, due_date: dueDate, content } = req.body;
    try {
      const milestoneid = parseInt(req.params.milestoneid);
      const updateInfo = [title, dueDate, content, milestoneid];
      milestoneModel.update(updateInfo);
      res.status(200).json({ message: '마일스톤 업데이트 완료' });
    } catch (err) {
      res.status(500).json(err);
    }
  },
  delete: (req, res) => {
    try {
      milestoneModel.delete(parseInt(req.params.milestoneid));
      res.status(200).json({ message: '마일스톤 삭제 완료' });
    } catch (err) {
      res.status(500).json(err);
    }
  },
};

module.exports = milestoneController;
