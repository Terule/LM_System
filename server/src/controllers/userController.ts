import { Request, Response } from 'express';
import userService from '../services/userService';

const createUser = async (req: Request, res: Response) => {
  const userData = req.body;
  const newUser = await userService.createUser(userData);
  res.status(200).json(newUser);
};

export default { createUser };
