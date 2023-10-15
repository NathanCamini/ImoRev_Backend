/*
  Warnings:

  - The primary key for the `properties` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `enderecoId` on the `properties` table. All the data in the column will be lost.
  - A unique constraint covering the columns `[enderecoid]` on the table `properties` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `enderecoid` to the `properties` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "properties" DROP CONSTRAINT "properties_enderecoId_fkey";

-- DropIndex
DROP INDEX "properties_enderecoId_key";

-- AlterTable
ALTER TABLE "properties" DROP CONSTRAINT "properties_pkey",
DROP COLUMN "enderecoId",
ADD COLUMN     "enderecoid" INTEGER NOT NULL,
ADD CONSTRAINT "properties_pkey" PRIMARY KEY ("id");

-- CreateIndex
CREATE UNIQUE INDEX "properties_enderecoid_key" ON "properties"("enderecoid");

-- AddForeignKey
ALTER TABLE "properties" ADD CONSTRAINT "properties_enderecoid_fkey" FOREIGN KEY ("enderecoid") REFERENCES "adress"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
