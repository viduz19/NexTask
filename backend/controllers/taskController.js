const Task = require('../models/taskModel');

// @desc    Get tasks
// @route   GET /api/tasks
// @access  Private
const getTasks = async (req, res) => {
    const tasks = await Task.find({ user: req.user.id });
    res.status(200).json(tasks);
};

// @desc    Set task
// @route   POST /api/tasks
// @access  Private
const setTask = async (req, res) => {
    if (!req.body.title || !req.body.scheduledTime) {
        return res.status(400).json({ message: 'Please add title and scheduled time' });
    }

    const task = await Task.create({
        title: req.body.title,
        scheduledTime: req.body.scheduledTime,
        user: req.user.id
    });

    res.status(201).json(task);
};

// @desc    Update task
// @route   PUT /api/tasks/:id
// @access  Private
const updateTask = async (req, res) => {
    const task = await Task.findById(req.params.id);

    if (!task) {
        return res.status(400).json({ message: 'Task not found' });
    }

    // Check for user
    if (!req.user) {
        return res.status(401).json({ message: 'User not found' });
    }

    // Make sure the logged in user matches the task user
    if (task.user.toString() !== req.user.id) {
        return res.status(401).json({ message: 'User not authorized' });
    }

    const updatedTask = await Task.findByIdAndUpdate(req.params.id, req.body, {
        new: true
    });

    res.status(200).json(updatedTask);
};

// @desc    Delete task
// @route   DELETE /api/tasks/:id
// @access  Private
const deleteTask = async (req, res) => {
    const task = await Task.findById(req.params.id);

    if (!task) {
        return res.status(400).json({ message: 'Task not found' });
    }

    // Check for user
    if (!req.user) {
        return res.status(401).json({ message: 'User not found' });
    }

    // Make sure the logged in user matches the task user
    if (task.user.toString() !== req.user.id) {
        return res.status(401).json({ message: 'User not authorized' });
    }

    await task.deleteOne();

    res.status(200).json({ id: req.params.id });
};

module.exports = {
    getTasks,
    setTask,
    updateTask,
    deleteTask
};
