/*
  Warnings:

  - The primary key for the `properties` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `enderecoId` on the `properties` table. All the data in the column will be lost.

*/
-- DropForeignKey
ALTER TABLE "properties" DROP CONSTRAINT "properties_enderecoId_fkey";

-- AlterTable
ALTER TABLE "properties" DROP CONSTRAINT "properties_pkey",
DROP COLUMN "enderecoId",
ADD CONSTRAINT "properties_pkey" PRIMARY KEY ("id");
