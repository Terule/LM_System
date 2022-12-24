-- CreateTable
CREATE TABLE `lm_user_role` (
    `id` VARCHAR(191) NOT NULL,
    `description` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `lm_users` ADD CONSTRAINT `lm_users_roleId_fkey` FOREIGN KEY (`roleId`) REFERENCES `lm_user_role`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
