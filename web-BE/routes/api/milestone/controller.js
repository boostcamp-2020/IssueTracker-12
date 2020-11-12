const milestoneModel = require('../../../models/milestone');

const milestoneController = {
  create: async (req, res) => {
    const { title, due_date: dueDate, content } = req.body;
    try {
      const insertInfo = [title, dueDate, content];
      const insertId = await milestoneModel.insert(insertInfo);
      res.status(200).json({ message: '마일스톤 생성 완료', insertId });
    } catch (err) {
      res.status(500).json(err);
    }
  },
  read: async (req, res) => {
    try {
      const milestoneArr = await milestoneModel.select();
      for (let i = 0; i < milestoneArr.length; i++) {
        const milestoneid = milestoneArr[i].milestone_id;
        const issueInfo = await milestoneController.selectIssuesFromMilestone(
          milestoneid
        );
        milestoneArr[i].issueInfo = issueInfo;
      }
      res
        .status(200)
        .json({ message: '마일스톤 읽기 성공', milestoneArray: milestoneArr });
    } catch (err) {
      res.status(500).json(err);
    }
  },
  update: async (req, res) => {
    const { title, due_date: dueDate, content } = req.body;
    try {
      const milestoneid = +req.params.milestoneid;
      const updateInfo = [title, dueDate, content, milestoneid];
      milestoneModel.update(updateInfo);
      res.status(200).json({ message: '마일스톤 업데이트 완료' });
    } catch (err) {
      res.status(500).json(err);
    }
  },
  delete: async (req, res) => {
    try {
      milestoneModel.delete(+req.params.milestoneid);
      console.log(parseInt(req.params.milestoneid));
      res.status(200).json({ message: '마일스톤 삭제 완료' });
    } catch (err) {
      res.status(500).json(err);
    }
  },
  selectIssuesFromMilestone: async (milestoneid) => {
    const result = await milestoneModel.selectIssuesFromMilestone(milestoneid);
    const totalIssue = result.length;
    let openedIssue = 0;
    for (let i = 0; i < totalIssue; i++) {
      if (result[i].is_open === 1) {
        openedIssue++;
      }
    }
    const closedIssue = totalIssue - openedIssue;
    const completed =
      totalIssue === 0 ? 0 : Math.round((closedIssue / totalIssue) * 100);
    const issueInfo = {
      openedIssue,
      closedIssue: totalIssue - openedIssue,
      completed: `${completed}%`,
    };
    return issueInfo;
  },
};

module.exports = milestoneController;
