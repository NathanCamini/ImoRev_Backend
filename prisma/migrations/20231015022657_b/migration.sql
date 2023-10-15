/*
  Warnings:

  - The primary key for the `image_properties` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `imovelId` on the `image_properties` table. All the data in the column will be lost.

*/
-- DropForeignKey
ALTER TABLE "image_properties" DROP CONSTRAINT "image_properties_imovelId_fkey";

-- AlterTable
ALTER TABLE "image_properties" DROP CONSTRAINT "image_properties_pkey",
DROP COLUMN "imovelId",
ADD CONSTRAINT "image_properties_pkey" PRIMARY KEY ("id");
