/*
  Warnings:

  - You are about to drop the column `issueDate` on the `NetworkBlacklist` table. All the data in the column will be lost.
  - You are about to drop the column `termDate` on the `NetworkBlacklist` table. All the data in the column will be lost.
  - Added the required column `issue_date` to the `NetworkBlacklist` table without a default value. This is not possible if the table is not empty.
  - Added the required column `term_date` to the `NetworkBlacklist` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE `NetworkBlacklist` DROP COLUMN `issueDate`,
    DROP COLUMN `termDate`,
    ADD COLUMN `issue_date` DATETIME(3) NOT NULL,
    ADD COLUMN `term_date` DATETIME(3) NOT NULL;

-- CreateTable
CREATE TABLE `account_password` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `account_hash` VARCHAR(191) NOT NULL,
    `password_hash` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `AccountPreference` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `receive_notifications` VARCHAR(191) NOT NULL,
    `default_theme` ENUM('WORK', 'LEGEND') NOT NULL DEFAULT 'WORK',

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
