const Notification = require('../models/notificationModel');

// @desc    Get notifications
// @route   GET /api/notifications
// @access  Private
const getNotifications = async (req, res) => {
    const notifications = await Notification.find({ user: req.user.id }).sort({ createdAt: -1 });
    res.status(200).json(notifications);
};

// @desc    Create notification
// @route   POST /api/notifications
// @access  Private
const createNotification = async (req, res) => {
    const { title, body, type } = req.body;

    if (!title || !body || !type) {
        return res.status(400).json({ message: 'Please add all fields' });
    }

    const notification = await Notification.create({
        user: req.user.id,
        title,
        body,
        type
    });

    res.status(201).json(notification);
};

// @desc    Mark notification as read
// @route   PUT /api/notifications/:id
// @access  Private
const markRead = async (req, res) => {
    const notification = await Notification.findById(req.params.id);

    if (!notification) {
        return res.status(400).json({ message: 'Notification not found' });
    }

    if (notification.user.toString() !== req.user.id) {
        return res.status(401).json({ message: 'User not authorized' });
    }

    notification.read = true;
    await notification.save();

    res.status(200).json(notification);
};

module.exports = {
    getNotifications,
    createNotification,
    markRead
};
