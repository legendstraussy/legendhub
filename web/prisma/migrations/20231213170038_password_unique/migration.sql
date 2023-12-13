/*
  Warnings:

  - A unique constraint covering the columns `[account_id]` on the table `account_password_resets` will be added. If there are existing duplicate values, this will fail.

*/
-- CreateIndex
CREATE UNIQUE INDEX `account_password_resets_account_id_key` ON `account_password_resets`(`account_id`);
