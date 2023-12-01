-- CreateTable
CREATE TABLE `accounts` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `mud_id` VARCHAR(191) NULL,
    `created_date` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `modified_date` DATETIME(3) NOT NULL,
    `first_name` VARCHAR(191) NULL,
    `last_name` VARCHAR(191) NULL,
    `email` VARCHAR(191) NOT NULL,
    `preferences` JSON NULL,
    `roles` JSON NULL,

    UNIQUE INDEX `accounts_email_key`(`email`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `account_notifications` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `account_id` INTEGER NOT NULL,
    `notification_id` INTEGER NOT NULL,
    `read` BOOLEAN NULL DEFAULT false,
    `read_date` DATETIME(3) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `account_passwords` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `account_id` INTEGER NOT NULL,
    `password_hash` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `network_history` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `account_id` INTEGER NOT NULL,
    `login_date` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `ip_address` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `network_blacklist` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `network_history_id` INTEGER NOT NULL,
    `issue_date` DATETIME(3) NOT NULL,
    `term_date` DATETIME(3) NOT NULL,
    `issuer` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `notifications` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `created_date` DATETIME(3) NOT NULL,
    `created_by` INTEGER NOT NULL,
    `type` ENUM('NEW_ITEM', 'NEW_QUEST', 'NEW_MOB', 'NEW_ARTICLE', 'EDIT_ITEM', 'EDIT_QUEST', 'EDIT_MOB', 'EDIT_ARTICLE', 'SYSTEM') NOT NULL,
    `title` VARCHAR(191) NOT NULL,
    `description` VARCHAR(191) NULL,
    `content` TEXT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

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
    `equipment_id` INTEGER NOT NULL,
    `stats_id` INTEGER NOT NULL,
    `version` VARCHAR(191) NOT NULL,
    `hometown` VARCHAR(191) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `character_stats` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `character_id` INTEGER NOT NULL,
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

    UNIQUE INDEX `character_stats_character_id_key`(`character_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `character_quests` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `character_id` INTEGER NOT NULL,
    `quest_id` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `character_equipment` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `character_id` INTEGER NOT NULL,
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

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `items` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `created_date` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `created_by` INTEGER NOT NULL,
    `modifiedDate` DATETIME(3) NULL,
    `modified_by` INTEGER NULL,
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
    `modified_date` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `author_id` INTEGER NOT NULL,
    `editor_id` INTEGER NOT NULL,
    `content` TEXT NOT NULL,
    `is_protected` BOOLEAN NOT NULL DEFAULT false,
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
    `source_id` INTEGER NULL,
    `tag_id` INTEGER NOT NULL,

    UNIQUE INDEX `applied_tags_source_id_key`(`source_id`),
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
ALTER TABLE `account_notifications` ADD CONSTRAINT `account_notifications_account_id_fkey` FOREIGN KEY (`account_id`) REFERENCES `accounts`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `account_passwords` ADD CONSTRAINT `account_passwords_account_id_fkey` FOREIGN KEY (`account_id`) REFERENCES `accounts`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `network_blacklist` ADD CONSTRAINT `network_blacklist_network_history_id_fkey` FOREIGN KEY (`network_history_id`) REFERENCES `network_history`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `network_blacklist` ADD CONSTRAINT `network_blacklist_issuer_fkey` FOREIGN KEY (`issuer`) REFERENCES `accounts`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `notifications` ADD CONSTRAINT `notifications_created_by_fkey` FOREIGN KEY (`created_by`) REFERENCES `accounts`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `characters` ADD CONSTRAINT `characters_account_id_fkey` FOREIGN KEY (`account_id`) REFERENCES `accounts`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `character_stats` ADD CONSTRAINT `character_stats_character_id_fkey` FOREIGN KEY (`character_id`) REFERENCES `characters`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `character_quests` ADD CONSTRAINT `character_quests_character_id_fkey` FOREIGN KEY (`character_id`) REFERENCES `characters`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `character_quests` ADD CONSTRAINT `character_quests_quest_id_fkey` FOREIGN KEY (`quest_id`) REFERENCES `quests`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `character_equipment` ADD CONSTRAINT `character_equipment_character_id_fkey` FOREIGN KEY (`character_id`) REFERENCES `characters`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `items` ADD CONSTRAINT `items_created_by_fkey` FOREIGN KEY (`created_by`) REFERENCES `accounts`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `items` ADD CONSTRAINT `items_modified_by_fkey` FOREIGN KEY (`modified_by`) REFERENCES `accounts`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `item_weapons` ADD CONSTRAINT `item_weapons_item_id_fkey` FOREIGN KEY (`item_id`) REFERENCES `items`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `item_weapons` ADD CONSTRAINT `item_weapons_ammo_type_id_fkey` FOREIGN KEY (`ammo_type_id`) REFERENCES `items`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `item_spells` ADD CONSTRAINT `item_spells_item_id_fkey` FOREIGN KEY (`item_id`) REFERENCES `items`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `item_spells` ADD CONSTRAINT `item_spells_spell_id_fkey` FOREIGN KEY (`spell_id`) REFERENCES `spells`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `spells` ADD CONSTRAINT `spells_created_by_fkey` FOREIGN KEY (`created_by`) REFERENCES `accounts`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `spells` ADD CONSTRAINT `spells_modified_by_fkey` FOREIGN KEY (`modified_by`) REFERENCES `accounts`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `potions` ADD CONSTRAINT `potions_created_by_fkey` FOREIGN KEY (`created_by`) REFERENCES `accounts`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `potions` ADD CONSTRAINT `potions_modified_by_fkey` FOREIGN KEY (`modified_by`) REFERENCES `accounts`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `skills` ADD CONSTRAINT `skills_created_by_fkey` FOREIGN KEY (`created_by`) REFERENCES `accounts`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `skills` ADD CONSTRAINT `skills_modified_by_fkey` FOREIGN KEY (`modified_by`) REFERENCES `accounts`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `abilities` ADD CONSTRAINT `abilities_created_by_fkey` FOREIGN KEY (`created_by`) REFERENCES `accounts`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `abilities` ADD CONSTRAINT `abilities_modified_by_fkey` FOREIGN KEY (`modified_by`) REFERENCES `accounts`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `quests` ADD CONSTRAINT `quests_created_by_fkey` FOREIGN KEY (`created_by`) REFERENCES `accounts`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `quests` ADD CONSTRAINT `quests_modified_by_fkey` FOREIGN KEY (`modified_by`) REFERENCES `accounts`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

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
ALTER TABLE `articles` ADD CONSTRAINT `articles_author_id_fkey` FOREIGN KEY (`author_id`) REFERENCES `accounts`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `articles` ADD CONSTRAINT `articles_editor_id_fkey` FOREIGN KEY (`editor_id`) REFERENCES `accounts`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `tags` ADD CONSTRAINT `tags_created_by_fkey` FOREIGN KEY (`created_by`) REFERENCES `accounts`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

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
ALTER TABLE `areas` ADD CONSTRAINT `areas_author_id_fkey` FOREIGN KEY (`author_id`) REFERENCES `accounts`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `change_logs` ADD CONSTRAINT `change_logs_created_by_fkey` FOREIGN KEY (`created_by`) REFERENCES `accounts`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
