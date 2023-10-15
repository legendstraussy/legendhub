/*
  Warnings:

  - A unique constraint covering the columns `[source_id]` on the table `applied_tags` will be added. If there are existing duplicate values, this will fail.

*/
-- DropIndex
DROP INDEX `network_blacklist_issuer_fkey` ON `network_blacklist`;

-- DropIndex
DROP INDEX `network_history_account_id_fkey` ON `network_history`;

-- DropIndex
DROP INDEX `notifications_created_by_fkey` ON `notifications`;

-- AlterTable
ALTER TABLE `applied_tags` MODIFY `source_id` INTEGER NULL;

-- AlterTable
ALTER TABLE `items` MODIFY `modifiedDate` DATETIME(3) NULL,
    MODIFY `modified_by` INTEGER NULL;

-- CreateIndex
CREATE UNIQUE INDEX `applied_tags_source_id_key` ON `applied_tags`(`source_id`);

-- AddForeignKey
ALTER TABLE `network_history` ADD CONSTRAINT `network_history_account_id_fkey` FOREIGN KEY (`account_id`) REFERENCES `account`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `network_blacklist` ADD CONSTRAINT `network_blacklist_network_history_id_fkey` FOREIGN KEY (`network_history_id`) REFERENCES `network_history`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `network_blacklist` ADD CONSTRAINT `network_blacklist_issuer_fkey` FOREIGN KEY (`issuer`) REFERENCES `account`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `notifications` ADD CONSTRAINT `notifications_created_by_fkey` FOREIGN KEY (`created_by`) REFERENCES `account`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `items` ADD CONSTRAINT `items_created_by_fkey` FOREIGN KEY (`created_by`) REFERENCES `account`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `items` ADD CONSTRAINT `items_modified_by_fkey` FOREIGN KEY (`modified_by`) REFERENCES `account`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `item_weapons` ADD CONSTRAINT `item_weapons_ammo_type_id_fkey` FOREIGN KEY (`ammo_type_id`) REFERENCES `items`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `spells` ADD CONSTRAINT `spells_created_by_fkey` FOREIGN KEY (`created_by`) REFERENCES `account`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `spells` ADD CONSTRAINT `spells_modified_by_fkey` FOREIGN KEY (`modified_by`) REFERENCES `account`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `potions` ADD CONSTRAINT `potions_created_by_fkey` FOREIGN KEY (`created_by`) REFERENCES `account`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `potions` ADD CONSTRAINT `potions_modified_by_fkey` FOREIGN KEY (`modified_by`) REFERENCES `account`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `skills` ADD CONSTRAINT `skills_created_by_fkey` FOREIGN KEY (`created_by`) REFERENCES `account`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `skills` ADD CONSTRAINT `skills_modified_by_fkey` FOREIGN KEY (`modified_by`) REFERENCES `account`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `abilities` ADD CONSTRAINT `abilities_created_by_fkey` FOREIGN KEY (`created_by`) REFERENCES `account`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `abilities` ADD CONSTRAINT `abilities_modified_by_fkey` FOREIGN KEY (`modified_by`) REFERENCES `account`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `quests` ADD CONSTRAINT `quests_created_by_fkey` FOREIGN KEY (`created_by`) REFERENCES `account`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `quests` ADD CONSTRAINT `quests_modified_by_fkey` FOREIGN KEY (`modified_by`) REFERENCES `account`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `stat_modifiers` ADD CONSTRAINT `item_source_fk` FOREIGN KEY (`source_id`) REFERENCES `items`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `stat_modifiers` ADD CONSTRAINT `quest_source_fk` FOREIGN KEY (`source_id`) REFERENCES `quests`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `stat_modifiers` ADD CONSTRAINT `ability_source_fk` FOREIGN KEY (`source_id`) REFERENCES `abilities`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `stat_modifiers` ADD CONSTRAINT `skill_source_fk` FOREIGN KEY (`source_id`) REFERENCES `skills`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `stat_modifiers` ADD CONSTRAINT `spell_source_fk` FOREIGN KEY (`source_id`) REFERENCES `spells`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `stat_modifiers` ADD CONSTRAINT `potion_source_fk` FOREIGN KEY (`source_id`) REFERENCES `potions`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `articles` ADD CONSTRAINT `articles_author_id_fkey` FOREIGN KEY (`author_id`) REFERENCES `account`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `article_versions` ADD CONSTRAINT `article_versions_editor_id_fkey` FOREIGN KEY (`editor_id`) REFERENCES `account`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `tags` ADD CONSTRAINT `tags_created_by_fkey` FOREIGN KEY (`created_by`) REFERENCES `account`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `applied_tags` ADD CONSTRAINT `applied_tags_tag_id_fkey` FOREIGN KEY (`tag_id`) REFERENCES `tags`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `applied_tags` ADD CONSTRAINT `article_tag_source_fk` FOREIGN KEY (`source_id`) REFERENCES `articles`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `applied_tags` ADD CONSTRAINT `item_tag_source_fk` FOREIGN KEY (`source_id`) REFERENCES `items`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `applied_tags` ADD CONSTRAINT `mob_tag_source_fk` FOREIGN KEY (`source_id`) REFERENCES `mobs`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `applied_tags` ADD CONSTRAINT `quest_tag_source_fk` FOREIGN KEY (`source_id`) REFERENCES `quests`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `mobs` ADD CONSTRAINT `mobs_area_id_fkey` FOREIGN KEY (`area_id`) REFERENCES `areas`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `areas` ADD CONSTRAINT `areas_author_id_fkey` FOREIGN KEY (`author_id`) REFERENCES `account`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `change_logs` ADD CONSTRAINT `change_logs_created_by_fkey` FOREIGN KEY (`created_by`) REFERENCES `account`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
