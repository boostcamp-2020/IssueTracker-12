const milestoneModel = require("../../../models/milestone");

const milestoneController = {
  create: (req, res) => {
    const { title, dueDate, content } = req.body;
    try {
      const insertInfo = [title, dueDate, content];
      milestoneModel.insert(insertInfo);
      res.status(200).json({ message: "마일스톤 생성 완료" });
    } catch (err) {
      res.status(500).json(err);
    }
  },
  read: async (req, res) => {
    try {
      const milestoneArr = await milestoneModel.select();
      res
        .status(200)
        .json({ message: "마일스톤 읽기 성공", MilestoneArray: milestoneArr });
    } catch (err) {
      res.status(500).json(err);
    }
  },
  update: (req, res) => {
    const { milestoneid, title, dueDate, content } = req.body;
    try {
      const updateInfo = [milstoneid, title, dueDate, content];
      milestoneModel.update(updateInfo);
      res.status(200).json({ message: "마일스톤 업데이트 완료" });
    } catch (err) {
      res.status(500).json(err);
    }
  },
  delete: (req, res) => {
    try {
      milestoneModel.delete(parseInt(req.query.milestoneid));
      res.status(200).json({ message: "마일스톤 삭제 완료" });
    } catch (err) {
      res.status(500).json(err);
    }
  },
};

module.exports = milestoneController;
