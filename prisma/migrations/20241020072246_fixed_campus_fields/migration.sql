/*
  Warnings:

  - You are about to drop the column `createdAt` on the `campus` table. All the data in the column will be lost.
  - You are about to drop the column `isActive` on the `campus` table. All the data in the column will be lost.
  - You are about to drop the column `isDeleted` on the `campus` table. All the data in the column will be lost.
  - You are about to drop the column `updatedAt` on the `campus` table. All the data in the column will be lost.
  - Added the required column `updated_at` to the `Campus` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE `campus` DROP COLUMN `createdAt`,
    DROP COLUMN `isActive`,
    DROP COLUMN `isDeleted`,
    DROP COLUMN `updatedAt`,
    ADD COLUMN `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    ADD COLUMN `is_active` BOOLEAN NOT NULL DEFAULT true,
    ADD COLUMN `is_deleted` BOOLEAN NOT NULL DEFAULT false,
    ADD COLUMN `updated_at` DATETIME(3) NOT NULL;
