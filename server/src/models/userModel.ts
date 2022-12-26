import { PrismaClient } from '@prisma/client';
import { User } from '../types/userType';

const prisma = new PrismaClient();

const createUser = async ({
  firstName, lastName, userName, passWord, roleId,
}: User) => {
  const newUser = await prisma.lm_users.create({
    data: {
      firstName,
      lastName,
      userName,
      passWord,
      roleId,
    },
  });
  return newUser;
};

export default { createUser };
