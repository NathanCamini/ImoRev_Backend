/*
  Warnings:

  - You are about to drop the column `ProfileId` on the `properties` table. All the data in the column will be lost.

*/
-- DropForeignKey
ALTER TABLE "properties" DROP CONSTRAINT "properties_ProfileId_fkey";

-- AlterTable
ALTER TABLE "properties" DROP COLUMN "ProfileId";
