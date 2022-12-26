/*
  Warnings:

  - You are about to drop the column `firtName` on the `lm_users` table. All the data in the column will be lost.
  - You are about to drop the column `passWord` on the `lm_users` table. All the data in the column will be lost.
  - You are about to drop the column `userName` on the `lm_users` table. All the data in the column will be lost.
  - A unique constraint covering the columns `[username]` on the table `lm_users` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `firstName` to the `lm_users` table without a default value. This is not possible if the table is not empty.
  - Added the required column `password` to the `lm_users` table without a default value. This is not possible if the table is not empty.
  - Added the required column `username` to the `lm_users` table without a default value. This is not possible if the table is not empty.

*/
-- DropIndex
DROP INDEX `lm_users_userName_key` ON `lm_users`;

-- AlterTable
ALTER TABLE `lm_users` DROP COLUMN `firtName`,
    DROP COLUMN `passWord`,
    DROP COLUMN `userName`,
    ADD COLUMN `firstName` VARCHAR(191) NOT NULL,
    ADD COLUMN `password` VARCHAR(191) NOT NULL,
    ADD COLUMN `username` VARCHAR(191) NOT NULL;

-- CreateIndex
CREATE UNIQUE INDEX `lm_users_username_key` ON `lm_users`(`username`);
