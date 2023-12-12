/*
  Warnings:

  - You are about to drop the column `reset_token` on the `account_passwords` table. All the data in the column will be lost.
  - You are about to drop the column `modifiedDate` on the `items` table. All the data in the column will be lost.
  - You are about to drop the column `modifiedDate` on the `potions` table. All the data in the column will be lost.
  - You are about to drop the column `modifiedDate` on the `quests` table. All the data in the column will be lost.
  - You are about to drop the column `modifiedDate` on the `spells` table. All the data in the column will be lost.
  - You are about to drop the column `ammoCapacity` on the `stat_modifiers` table. All the data in the column will be lost.
  - You are about to drop the column `bonusAccuracy` on the `stat_modifiers` table. All the data in the column will be lost.
  - You are about to drop the column `conCap` on the `stat_modifiers` table. All the data in the column will be lost.
  - You are about to drop the column `dexCap` on the `stat_modifiers` table. All the data in the column will be lost.
  - You are about to drop the column `hpRegen` on the `stat_modifiers` table. All the data in the column will be lost.
  - You are about to drop the column `maRegen` on the `stat_modifiers` table. All the data in the column will be lost.
  - You are about to drop the column `minCap` on the `stat_modifiers` table. All the data in the column will be lost.
  - You are about to drop the column `mvRegen` on the `stat_modifiers` table. All the data in the column will be lost.
  - You are about to drop the column `perCap` on the `stat_modifiers` table. All the data in the column will be lost.
  - You are about to drop the column `shotAccuracy` on the `stat_modifiers` table. All the data in the column will be lost.
  - You are about to drop the column `spellCrit` on the `stat_modifiers` table. All the data in the column will be lost.
  - You are about to drop the column `spellDam` on the `stat_modifiers` table. All the data in the column will be lost.
  - You are about to drop the column `spellRedux` on the `stat_modifiers` table. All the data in the column will be lost.
  - You are about to drop the column `spiCap` on the `stat_modifiers` table. All the data in the column will be lost.
  - You are about to drop the column `strCap` on the `stat_modifiers` table. All the data in the column will be lost.
  - Added the required column `modified_date` to the `potions` table without a default value. This is not possible if the table is not empty.
  - Added the required column `modified_date` to the `quests` table without a default value. This is not possible if the table is not empty.
  - Added the required column `modified_date` to the `spells` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE `account_passwords` DROP COLUMN `reset_token`;

-- AlterTable
ALTER TABLE `items` DROP COLUMN `modifiedDate`,
    ADD COLUMN `modified_date` DATETIME(3) NULL;

-- AlterTable
ALTER TABLE `potions` DROP COLUMN `modifiedDate`,
    ADD COLUMN `modified_date` DATETIME(3) NOT NULL;

-- AlterTable
ALTER TABLE `quests` DROP COLUMN `modifiedDate`,
    ADD COLUMN `modified_date` DATETIME(3) NOT NULL;

-- AlterTable
ALTER TABLE `spells` DROP COLUMN `modifiedDate`,
    ADD COLUMN `modified_date` DATETIME(3) NOT NULL;

-- AlterTable
ALTER TABLE `stat_modifiers` DROP COLUMN `ammoCapacity`,
    DROP COLUMN `bonusAccuracy`,
    DROP COLUMN `conCap`,
    DROP COLUMN `dexCap`,
    DROP COLUMN `hpRegen`,
    DROP COLUMN `maRegen`,
    DROP COLUMN `minCap`,
    DROP COLUMN `mvRegen`,
    DROP COLUMN `perCap`,
    DROP COLUMN `shotAccuracy`,
    DROP COLUMN `spellCrit`,
    DROP COLUMN `spellDam`,
    DROP COLUMN `spellRedux`,
    DROP COLUMN `spiCap`,
    DROP COLUMN `strCap`,
    ADD COLUMN `ammo_capacity` INTEGER NULL,
    ADD COLUMN `bonus_accuracy` INTEGER NULL,
    ADD COLUMN `con_cap` INTEGER NULL,
    ADD COLUMN `dex_cap` INTEGER NULL,
    ADD COLUMN `hp_regen` INTEGER NULL,
    ADD COLUMN `ma_regen` INTEGER NULL,
    ADD COLUMN `min_cap` INTEGER NULL,
    ADD COLUMN `mv_regen` INTEGER NULL,
    ADD COLUMN `per_cap` INTEGER NULL,
    ADD COLUMN `shot_accuracy` INTEGER NULL,
    ADD COLUMN `spell_crit` INTEGER NULL,
    ADD COLUMN `spell_dam` INTEGER NULL,
    ADD COLUMN `spell_redux` INTEGER NULL,
    ADD COLUMN `spi_cap` INTEGER NULL,
    ADD COLUMN `str_cap` INTEGER NULL;

-- CreateTable
CREATE TABLE `account_password_resets` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `account_id` INTEGER NOT NULL,
    `reset_token` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `account_password_resets` ADD CONSTRAINT `account_password_resets_account_id_fkey` FOREIGN KEY (`account_id`) REFERENCES `accounts`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;
