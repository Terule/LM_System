-- CreateTable
CREATE TABLE `lm_details` (
    `id` VARCHAR(191) NOT NULL,
    `description` VARCHAR(191) NOT NULL,
    `serviceId` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `lm_details` ADD CONSTRAINT `lm_details_serviceId_fkey` FOREIGN KEY (`serviceId`) REFERENCES `lm_services`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
