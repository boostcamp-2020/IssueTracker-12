const router = require("express").Router();
const commentRouter = require("./comment");
const issueController = require("./controller");

router.use("/:issueId/comment", commentRouter);

router.post("/", issueController.create);
router.get("/", issueController.read);
router.get("/:issueId", issueController.readById);
router.patch("/:issueId/title", issueController.updateTitle);
router.post("/:issueId/milestone/:milestoneId", issueController.addMilestone);
router.delete("/:issueId/milestone", issueController.deleteMilestone);
router.put("/:issueId/milestone", issueController.deleteMilestone);
router.put("/:issueId/label", issueController.updateAllIssueLabel);
router.post("/:issueId/label/:labelId", issueController.addLabel);
router.delete("/:issueId/label/:labelId", issueController.deleteLabel);
router.patch("/:issueId/isopen", issueController.updateIsOpen);
router.post("/:issueId/assignee/:userId", issueController.addAssignee);
router.put("/:issueId/assignee", issueController.updateAllAssignee);
router.delete("/:issueId/assignee/:userId", issueController.deleteAssignee);
router.get("/:issueId/assignee", issueController.readAssignee);

module.exports = router;
