/*
  Warnings:

  - You are about to alter the column `value` on the `lm_details` table. The data in that column could be lost. The data in that column will be cast from `VarChar(191)` to `Decimal(65,30)`.
  - A unique constraint covering the columns `[serviceId,sellId]` on the table `lm_details` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `sellId` to the `lm_details` table without a default value. This is not possible if the table is not empty.
  - Added the required column `dueDate` to the `lm_installments` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE `lm_details` ADD COLUMN `sellId` VARCHAR(191) NOT NULL,
    MODIFY `value` DECIMAL(65, 30) NOT NULL;

-- AlterTable
ALTER TABLE `lm_installments` ADD COLUMN `dueDate` DATETIME(3) NOT NULL;

-- CreateTable
CREATE TABLE `lm_sell` (
    `id` VARCHAR(191) NOT NULL,
    `clientId` VARCHAR(191) NOT NULL,
    `paymentId` VARCHAR(191) NOT NULL,
    `created` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `active` BOOLEAN NOT NULL DEFAULT true,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `lm_payment` (
    `id` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateIndex
CREATE UNIQUE INDEX `lm_details_serviceId_sellId_key` ON `lm_details`(`serviceId`, `sellId`);

-- AddForeignKey
ALTER TABLE `lm_details` ADD CONSTRAINT `lm_details_sellId_fkey` FOREIGN KEY (`sellId`) REFERENCES `lm_sell`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
