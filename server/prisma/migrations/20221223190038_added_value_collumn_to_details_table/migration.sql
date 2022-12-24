/*
  Warnings:

  - Added the required column `value` to the `lm_details` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE `lm_details` ADD COLUMN `value` VARCHAR(191) NOT NULL;
