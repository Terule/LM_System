import { PrismaClient } from '@prisma/client';

const prisma = new PrismaClient();

const main = async () => {
  const sysAdminRole = await prisma.lm_user_role.create({
    data:
      { description: 'System Admin' },
  });

  const adminRole = await prisma.lm_user_role.create({
    data:
      { description: 'Admin' },
  });
  await prisma.lm_user_role.create({
    data:
      { description: 'User' },
  });
  await prisma.lm_users.createMany({
    data: [
      {
        firstName: 'Rafael',
        lastName: 'Aguiar',
        username: 'terule',
        password: '123456',
        roleId: sysAdminRole.id,
      },
      {
        firstName: 'Admin',
        lastName: 'Admin',
        username: 'admin',
        password: '123456',
        roleId: adminRole.id,
      },
    ],
  });

  await prisma.lm_services.create({
    data: {
      name: 'Teste',
    },
  });

  await prisma.lm_payment_type.createMany({
    data: [
      { description: 'À Vista' },
      { description: 'Boleto' },
      { description: 'Crédito' },
      { description: 'Débito' },
    ],
  });
};

main();
