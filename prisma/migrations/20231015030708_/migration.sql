/*
  Warnings:

  - You are about to drop the `AccountPreference` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `AccountRole` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `NetworkBlacklist` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `NetworkHistory` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `account_password` table. If the table is not empty, all the data it contains will be lost.
  - A unique constraint covering the columns `[email]` on the table `Account` will be added. If there are existing duplicate values, this will fail.

*/
-- DropForeignKey
ALTER TABLE `AccountRole` DROP FOREIGN KEY `AccountRole_account_id_fkey`;

-- DropForeignKey
ALTER TABLE `NetworkBlacklist` DROP FOREIGN KEY `NetworkBlacklist_issuer_fkey`;

-- DropForeignKey
ALTER TABLE `NetworkHistory` DROP FOREIGN KEY `NetworkHistory_account_id_fkey`;

-- DropTable
DROP TABLE `AccountPreference`;

-- DropTable
DROP TABLE `AccountRole`;

-- DropTable
DROP TABLE `NetworkBlacklist`;

-- DropTable
DROP TABLE `NetworkHistory`;

-- DropTable
DROP TABLE `account_password`;

-- CreateTable
CREATE TABLE `account_passwords` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `account_hash` VARCHAR(191) NOT NULL,
    `password_hash` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `account_preferences` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `receive_notifications` VARCHAR(191) NULL,
    `default_theme` ENUM('WORK', 'LEGEND') NULL DEFAULT 'WORK',
    `show_side_panel` BOOLEAN NULL DEFAULT true,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `account_roles` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `account_id` INTEGER NOT NULL,
    `role` ENUM('PLAYER', 'EXPLORER', 'SCRIBE', 'ADMIN', 'DEV') NOT NULL DEFAULT 'PLAYER',

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
CREATE TABLE `network_history` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `account_id` INTEGER NOT NULL,
    `created_date` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `login_date` DATETIME(3) NOT NULL,
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

-- CreateIndex
CREATE UNIQUE INDEX `Account_email_key` ON `Account`(`email`);

-- AddForeignKey
ALTER TABLE `account_roles` ADD CONSTRAINT `account_roles_account_id_fkey` FOREIGN KEY (`account_id`) REFERENCES `Account`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `network_history` ADD CONSTRAINT `network_history_account_id_fkey` FOREIGN KEY (`account_id`) REFERENCES `Account`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `network_blacklist` ADD CONSTRAINT `network_blacklist_issuer_fkey` FOREIGN KEY (`issuer`) REFERENCES `Account`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `notifications` ADD CONSTRAINT `notifications_created_by_fkey` FOREIGN KEY (`created_by`) REFERENCES `Account`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
