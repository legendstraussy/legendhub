/*
  Warnings:

  - You are about to drop the `account_preferences` table. If the table is not empty, all the data it contains will be lost.
  - Added the required column `account_preference_id` to the `account` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE `network_blacklist` DROP FOREIGN KEY `network_blacklist_issuer_fkey`;

-- DropForeignKey
ALTER TABLE `network_history` DROP FOREIGN KEY `network_history_account_id_fkey`;

-- DropForeignKey
ALTER TABLE `notifications` DROP FOREIGN KEY `notifications_created_by_fkey`;

-- AlterTable
ALTER TABLE `account` ADD COLUMN `account_preference_id` INTEGER NOT NULL,
    ADD COLUMN `preferences` JSON NULL;

-- DropTable
DROP TABLE `account_preferences`;

-- CreateTable
CREATE TABLE `characters` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `mud_id` INTEGER NULL,
    `account_id` INTEGER NOT NULL,
    `created_date` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `modified_date` DATETIME(3) NOT NULL,
    `name` VARCHAR(191) NOT NULL,
    `description` VARCHAR(191) NULL,
    `level` INTEGER NULL DEFAULT 50,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `character_versions` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `character_id` INTEGER NOT NULL,
    `equipment_id` INTEGER NOT NULL,
    `stats_id` INTEGER NOT NULL,
    `created_date` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `modified_date` DATETIME(3) NOT NULL,
    `version` VARCHAR(191) NOT NULL,
    `hometown` VARCHAR(191) NULL,
    `characterEquipmentId` INTEGER NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `character_stats` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `character_version_id` INTEGER NOT NULL,
    `str` INTEGER NULL DEFAULT 50,
    `min` INTEGER NULL DEFAULT 50,
    `dex` INTEGER NULL DEFAULT 50,
    `con` INTEGER NULL DEFAULT 16,
    `per` INTEGER NULL DEFAULT 16,
    `spi` INTEGER NULL DEFAULT 16,
    `str_swap` INTEGER NULL DEFAULT 0,
    `min_swap` INTEGER NULL DEFAULT 0,
    `dex_swap` INTEGER NULL DEFAULT 0,
    `con_swap` INTEGER NULL DEFAULT 0,
    `per_swap` INTEGER NULL DEFAULT 0,
    `spi_swap` INTEGER NULL DEFAULT 0,

    UNIQUE INDEX `character_stats_character_version_id_key`(`character_version_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `character_quests` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `character_version_id` INTEGER NOT NULL,
    `quest_id` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `character_equipment` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `light` INTEGER NULL,
    `finger_1` INTEGER NULL,
    `finger_2` INTEGER NULL,
    `neck_1` INTEGER NULL,
    `neck_2` INTEGER NULL,
    `body` INTEGER NULL,
    `head` INTEGER NULL,
    `hands` INTEGER NULL,
    `feet` INTEGER NULL,
    `face` INTEGER NULL,
    `arms` INTEGER NULL,
    `legs` INTEGER NULL,
    `about` INTEGER NULL,
    `waist` INTEGER NULL,
    `wrist_1` INTEGER NULL,
    `wrist_2` INTEGER NULL,
    `wield` INTEGER NULL,
    `hold_1` INTEGER NULL,
    `hold_2` INTEGER NULL,
    `hold_3` INTEGER NULL,
    `ear_1` INTEGER NULL,
    `ear_2` INTEGER NULL,
    `arm` INTEGER NULL,
    `amulet` INTEGER NULL,
    `aux` INTEGER NULL,
    `itemId` INTEGER NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `items` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `created_date` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `created_by` INTEGER NOT NULL,
    `modifiedDate` DATETIME(3) NOT NULL,
    `modified_by` INTEGER NOT NULL,
    `short_description` VARCHAR(191) NOT NULL,
    `long_description` VARCHAR(191) NULL,
    `timer` INTEGER NULL DEFAULT -1,
    `align` ENUM('GNE', 'GN', 'GE', 'NE', 'G', 'N', 'E') NULL DEFAULT 'GNE',
    `rent` INTEGER NULL,
    `preservable` BOOLEAN NULL DEFAULT false,
    `net_stat` INTEGER NULL,
    `notes` TEXT NULL,
    `weight` DOUBLE NULL DEFAULT 0.0,
    `slots` VARCHAR(191) NULL,
    `is_bonded` BOOLEAN NULL DEFAULT false,
    `is_castable` BOOLEAN NULL DEFAULT false,
    `is_heroic` BOOLEAN NULL DEFAULT false,
    `is_level_required` BOOLEAN NULL DEFAULT false,
    `is_light` BOOLEAN NULL DEFAULT false,
    `is_limited` BOOLEAN NULL DEFAULT false,
    `is_soulbound` BOOLEAN NULL DEFAULT false,
    `is_unique` BOOLEAN NULL DEFAULT false,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `item_weapons` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `item_id` INTEGER NOT NULL,
    `quality` INTEGER NULL,
    `speed` INTEGER NULL,
    `is_holdable` BOOLEAN NOT NULL DEFAULT false,
    `is_two_handed` BOOLEAN NOT NULL DEFAULT false,
    `ammo_capacity` INTEGER NULL,
    `ammo_type_id` INTEGER NOT NULL,
    `shot_accuracy` INTEGER NULL,
    `max_damage` INTEGER NULL,
    `min_damage` INTEGER NULL,
    `avg_damage` INTEGER NULL,
    `stat` ENUM('STR', 'DEX', 'CON') NULL,
    `type` ENUM('BLUNT', 'PIERCE', 'SLASH') NULL,

    UNIQUE INDEX `item_weapons_item_id_key`(`item_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `item_spells` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `item_id` INTEGER NOT NULL,
    `spell_id` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `spells` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `created_date` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `created_by` INTEGER NOT NULL,
    `modifiedDate` DATETIME(3) NOT NULL,
    `modified_by` INTEGER NOT NULL,
    `name` VARCHAR(191) NOT NULL,
    `description` VARCHAR(191) NULL,
    `notes` TEXT NULL,
    `words` VARCHAR(191) NULL,
    `level_requirement` INTEGER NULL DEFAULT 0,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `potions` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `created_date` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `created_by` INTEGER NOT NULL,
    `modifiedDate` DATETIME(3) NOT NULL,
    `modified_by` INTEGER NOT NULL,
    `name` VARCHAR(191) NOT NULL,
    `description` VARCHAR(191) NULL,
    `notes` TEXT NULL,
    `duration` INTEGER NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `skills` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `created_date` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `created_by` INTEGER NOT NULL,
    `modified_date` DATETIME(3) NOT NULL,
    `modified_by` INTEGER NOT NULL,
    `name` VARCHAR(191) NOT NULL,
    `description` VARCHAR(191) NULL,
    `notes` TEXT NULL,
    `trainable` BOOLEAN NULL,
    `level_requirement` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `abilities` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `created_date` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `created_by` INTEGER NOT NULL,
    `modified_date` DATETIME(3) NOT NULL,
    `modified_by` INTEGER NOT NULL,
    `name` VARCHAR(191) NOT NULL,
    `description` VARCHAR(191) NULL,
    `notes` TEXT NULL,
    `first_rank_points` INTEGER NULL,
    `second_rank_points` INTEGER NULL,
    `third_rank_points` INTEGER NULL,
    `fourth_rank_points` INTEGER NULL,
    `fifth_rank_points` INTEGER NULL,
    `sixth_rank_points` INTEGER NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `quests` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `created_date` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `created_by` INTEGER NOT NULL,
    `modifiedDate` DATETIME(3) NOT NULL,
    `modified_by` INTEGER NOT NULL,
    `name` VARCHAR(191) NOT NULL,
    `description` VARCHAR(191) NULL,
    `notes` TEXT NULL,
    `whoises` VARCHAR(191) NULL,
    `pretitles` VARCHAR(191) NULL,
    `post_titles` VARCHAR(191) NULL,
    `experience` INTEGER NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `stat_modifiers` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `type` ENUM('ABILITITY', 'ITEM', 'POTION', 'QUEST', 'SKILL', 'SPELL') NOT NULL,
    `source_id` INTEGER NOT NULL,
    `hp` INTEGER NULL,
    `mv` INTEGER NULL,
    `ma` INTEGER NULL,
    `ac` INTEGER NULL,
    `str` INTEGER NULL,
    `min` INTEGER NULL,
    `dex` INTEGER NULL,
    `con` INTEGER NULL,
    `per` INTEGER NULL,
    `spi` INTEGER NULL,
    `hpRegen` INTEGER NULL,
    `mvRegen` INTEGER NULL,
    `maRegen` INTEGER NULL,
    `damroll` INTEGER NULL,
    `hitroll` INTEGER NULL,
    `mitigation` INTEGER NULL,
    `spellDam` INTEGER NULL,
    `spellCrit` INTEGER NULL,
    `spellRedux` INTEGER NULL,
    `concentration` INTEGER NULL,
    `shotAccuracy` INTEGER NULL,
    `bonusAccuracy` INTEGER NULL,
    `ammoCapacity` INTEGER NULL,
    `parry` INTEGER NULL,
    `strCap` INTEGER NULL,
    `minCap` INTEGER NULL,
    `dexCap` INTEGER NULL,
    `conCap` INTEGER NULL,
    `perCap` INTEGER NULL,
    `spiCap` INTEGER NULL,

    UNIQUE INDEX `stat_modifiers_type_key`(`type`),
    UNIQUE INDEX `stat_modifiers_source_id_key`(`source_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `articles` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `created_date` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `author_id` INTEGER NOT NULL,
    `is_protected` BOOLEAN NOT NULL DEFAULT false,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `article_versions` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `article_id` INTEGER NOT NULL,
    `modified_date` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `editor_id` INTEGER NOT NULL,
    `content` TEXT NOT NULL,
    `is_current` BOOLEAN NOT NULL,
    `version` VARCHAR(191) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `tags` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `created_date` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `created_by` INTEGER NOT NULL,
    `tag` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `applied_tags` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `type_id` ENUM('ARTICLE', 'ITEM', 'MOB', 'QUEST') NOT NULL,
    `source_id` INTEGER NOT NULL,
    `tag_id` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `mobs` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `mud_id` INTEGER NULL,
    `area_id` INTEGER NULL,
    `short_description` VARCHAR(191) NOT NULL,
    `long_description` VARCHAR(191) NULL,
    `level` INTEGER NULL,
    `is_aggressive` BOOLEAN NOT NULL DEFAULT false,
    `experience` INTEGER NULL,
    `gold` INTEGER NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `areas` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `mud_id` INTEGER NULL,
    `name` VARCHAR(191) NOT NULL,
    `author_id` INTEGER NULL,
    `release_date` DATETIME(3) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `change_logs` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `created_date` DATETIME(3) NOT NULL,
    `created_by` INTEGER NOT NULL,
    `content` TEXT NULL,
    `version` VARCHAR(191) NULL,
    `release_date` DATETIME(3) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `account_notifications` ADD CONSTRAINT `account_notifications_account_id_fkey` FOREIGN KEY (`account_id`) REFERENCES `account`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `characters` ADD CONSTRAINT `characters_account_id_fkey` FOREIGN KEY (`account_id`) REFERENCES `account`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `character_versions` ADD CONSTRAINT `character_versions_character_id_fkey` FOREIGN KEY (`character_id`) REFERENCES `characters`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `character_versions` ADD CONSTRAINT `character_versions_characterEquipmentId_fkey` FOREIGN KEY (`characterEquipmentId`) REFERENCES `character_equipment`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `character_stats` ADD CONSTRAINT `character_stats_character_version_id_fkey` FOREIGN KEY (`character_version_id`) REFERENCES `character_versions`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `character_quests` ADD CONSTRAINT `character_quests_character_version_id_fkey` FOREIGN KEY (`character_version_id`) REFERENCES `character_versions`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `character_quests` ADD CONSTRAINT `character_quests_quest_id_fkey` FOREIGN KEY (`quest_id`) REFERENCES `quests`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `character_equipment` ADD CONSTRAINT `character_equipment_itemId_fkey` FOREIGN KEY (`itemId`) REFERENCES `items`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `item_weapons` ADD CONSTRAINT `item_weapons_item_id_fkey` FOREIGN KEY (`item_id`) REFERENCES `items`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `item_spells` ADD CONSTRAINT `item_spells_item_id_fkey` FOREIGN KEY (`item_id`) REFERENCES `items`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `item_spells` ADD CONSTRAINT `item_spells_spell_id_fkey` FOREIGN KEY (`spell_id`) REFERENCES `spells`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `article_versions` ADD CONSTRAINT `article_versions_article_id_fkey` FOREIGN KEY (`article_id`) REFERENCES `articles`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
