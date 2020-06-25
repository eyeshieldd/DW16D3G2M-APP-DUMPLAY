'use strict';
module.exports = (sequelize, DataTypes) => {
	const User = sequelize.define(
		'User',
		{
			fullName: DataTypes.STRING,
			email: DataTypes.STRING,
			password: DataTypes.STRING,
			role: DataTypes.INTEGER,
			gender: DataTypes.STRING,
			phone: DataTypes.STRING,
			address: DataTypes.STRING,
			subscribe: DataTypes.BOOLEAN
		},
		{}
	);
	User.associate = function (models) {
	};
	return User;
};
