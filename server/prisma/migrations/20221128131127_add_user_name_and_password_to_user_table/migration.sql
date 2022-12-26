/*
  Warnings:

  - You are about to drop the column `name` on the `lm_users` table. All the data in the column will be lost.
  - A unique constraint covering the columns `[userName]` on the table `lm_users` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `firtName` to the `lm_users` table without a default value. This is not possible if the table is not empty.
  - Added the required column `lastName` to the `lm_users` table without a default value. This is not possible if the table is not empty.
  - Added the required column `passWord` to the `lm_users` table without a default value. This is not possible if the table is not empty.
  - Added the required column `userName` to the `lm_users` table without a default value. This is not possible if the table is not empty.

*/
-- DropIndex
DROP INDEX `lm_users_name_key` ON `lm_users`;

-- AlterTable
ALTER TABLE `lm_users` DROP COLUMN `name`,
    ADD COLUMN `firtName` VARCHAR(191) NOT NULL,
    ADD COLUMN `lastName` VARCHAR(191) NOT NULL,
    ADD COLUMN `passWord` VARCHAR(191) NOT NULL,
    ADD COLUMN `userName` VARCHAR(191) NOT NULL;

-- CreateIndex
CREATE UNIQUE INDEX `lm_users_userName_key` ON `lm_users`(`userName`);
