/*
  Warnings:

  - You are about to drop the `lm_users` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE `lm_users` DROP FOREIGN KEY `lm_users_roleId_fkey`;

-- DropTable
DROP TABLE `lm_users`;
