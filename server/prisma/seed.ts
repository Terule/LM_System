import { PrismaClient } from "@prisma/client";

const prisma = new PrismaClient()

const main = async () => {
  const sysAdminRole = await prisma.lm_user_role.create({
    data: 
      {description: 'System Admin'},
  });

  const adminRole = await prisma.lm_user_role.create({
    data:
      {description: 'Admin'},
  })
  const userRole = await prisma.lm_user_role.create({
    data:
      {description: 'User'},
  })
  const user = await prisma.lm_users.createMany({
    data: [
      {
        firtName: 'Rafael',
        lastName: 'Aguiar',
        userName: 'terule',
        passWord: '123456',
        roleId: sysAdminRole.id
      },
      {
        firtName: 'Admin',
        lastName: 'Admin',
        userName: 'admin',
        passWord: '123456',
        roleId: adminRole.id
      }
    ]
  });

  const service = await prisma.lm_services.create({
    data: {
      name: 'Teste',
    }
  });

  const paymentTypes = await prisma.lm_payment_type.createMany({
    data: [
      {description: 'À Vista'},
      {description: 'Boleto'},
      {description: 'Crédito'},
      {description: 'Débito'},
    ]
  })
};

main();