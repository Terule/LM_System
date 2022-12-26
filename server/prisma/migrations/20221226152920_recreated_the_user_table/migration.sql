-- CreateTable
CREATE TABLE `lm_users` (
    `id` VARCHAR(191) NOT NULL,
    `firstName` VARCHAR(191) NOT NULL,
    `lastName` VARCHAR(191) NOT NULL,
    `username` VARCHAR(191) NOT NULL,
    `password` VARCHAR(191) NOT NULL,
    `active` BOOLEAN NOT NULL DEFAULT true,
    `roleId` VARCHAR(191) NOT NULL,

    UNIQUE INDEX `lm_users_username_key`(`username`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `lm_users` ADD CONSTRAINT `lm_users_roleId_fkey` FOREIGN KEY (`roleId`) REFERENCES `lm_user_role`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
