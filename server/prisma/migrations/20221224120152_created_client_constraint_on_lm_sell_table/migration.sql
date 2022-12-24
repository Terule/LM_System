-- AddForeignKey
ALTER TABLE `lm_sell` ADD CONSTRAINT `lm_sell_clientId_fkey` FOREIGN KEY (`clientId`) REFERENCES `lm_clients`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;
