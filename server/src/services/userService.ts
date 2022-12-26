import { User } from '../types/userType';
import userModel from '../models/userModel';

const createUser = async (userData: User) => {
  const newUser = userModel.createUser(userData);
  return newUser;
};

export default { createUser };
