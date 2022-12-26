import jwt, { JwtPayload } from 'jsonwebtoken';
import 'dotenv/config';
import { UserLogin } from '../types/userTybe';

const secret = process.env.JWT_SECRET || 'a7fefc60-2cdf-4c3c-a3d8-2f710e1a9846';
const tokenConfig:object = {
  algorithm: 'HS256',
  expiresIn: '1d',
};

export const createToken = (user:UserLogin):string => {
  const token = jwt.sign({ data: user }, secret, tokenConfig);
  return token;
};

export const verifyToken = (token:string) => {
  const payload: string | JwtPayload = jwt.verify(token, secret);
  return payload;
};
