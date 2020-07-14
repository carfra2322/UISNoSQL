const mongoose = require('mongoose');

// User Schema
const userSchema = module.exports = mongoose.Schema({
	name:{
		type: String,
		required: true
	},
	email:{
		type: String,
		default: true
	}
});



const User = module.exports = mongoose.model('User', userSchema);

// Get All Users - find method
module.exports.getUsers = (callback, limit) => {
        User.find(callback).limit(limit);
}

// Get User - findById method
module.exports.getUserById = (id, callback) => {
	User.findById(id).exec(callback);
}

// Add User - create method
module.exports.addUser = (user, callback) => {
	User.create(user, callback);
};

// Update User - findOneAndUpdate method
module.exports.updateUser = (id, newUser, options, callback) => {
	query = User.findById(id)
	User.findOneAndUpdate(query, newUser, options, callback);
};

// Delete User - deleteOne method
module.exports.removeUser = (user, callback) => {
	User.deleteOne(User.findById(user), callback);
};
