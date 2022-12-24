/*
  Warnings:

  - You are about to drop the column `active` on the `lm_sell` table. All the data in the column will be lost.
  - A unique constraint covering the columns `[sellId]` on the table `lm_payment` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[paymentId]` on the table `lm_sell` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `paymentDate` to the `lm_installments` table without a default value. This is not possible if the table is not empty.
  - Added the required column `paymentId` to the `lm_installments` table without a default value. This is not possible if the table is not empty.
  - Added the required column `paymentTypeId` to the `lm_payment` table without a default value. This is not possible if the table is not empty.
  - Added the required column `sellId` to the `lm_payment` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE `lm_installments` ADD COLUMN `paymentDate` DATETIME(3) NOT NULL,
    ADD COLUMN `paymentId` VARCHAR(191) NOT NULL;

-- AlterTable
ALTER TABLE `lm_payment` ADD COLUMN `paymentTypeId` VARCHAR(191) NOT NULL,
    ADD COLUMN `sellId` VARCHAR(191) NOT NULL;

-- AlterTable
ALTER TABLE `lm_sell` DROP COLUMN `active`;

-- CreateIndex
CREATE UNIQUE INDEX `lm_payment_sellId_key` ON `lm_payment`(`sellId`);

-- CreateIndex
CREATE UNIQUE INDEX `lm_sell_paymentId_key` ON `lm_sell`(`paymentId`);

-- AddForeignKey
ALTER TABLE `lm_installments` ADD CONSTRAINT `lm_installments_paymentId_fkey` FOREIGN KEY (`paymentId`) REFERENCES `lm_payment`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `lm_payment` ADD CONSTRAINT `lm_payment_paymentTypeId_fkey` FOREIGN KEY (`paymentTypeId`) REFERENCES `lm_payment_type`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `lm_payment` ADD CONSTRAINT `lm_payment_sellId_fkey` FOREIGN KEY (`sellId`) REFERENCES `lm_sell`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;
