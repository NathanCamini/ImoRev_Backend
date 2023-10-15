/*
  Warnings:

  - The primary key for the `documents` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `ProfileId` on the `documents` table. All the data in the column will be lost.
  - The primary key for the `properties` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - Added the required column `profileId` to the `documents` table without a default value. This is not possible if the table is not empty.
  - Added the required column `enderecoId` to the `properties` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "documents" DROP CONSTRAINT "documents_ProfileId_fkey";

-- AlterTable
ALTER TABLE "documents" DROP CONSTRAINT "documents_pkey",
DROP COLUMN "ProfileId",
ADD COLUMN     "profileId" INTEGER NOT NULL,
ADD CONSTRAINT "documents_pkey" PRIMARY KEY ("id", "profileId");

-- AlterTable
ALTER TABLE "properties" DROP CONSTRAINT "properties_pkey",
ADD COLUMN     "enderecoId" INTEGER NOT NULL,
ADD CONSTRAINT "properties_pkey" PRIMARY KEY ("id", "enderecoId");

-- AddForeignKey
ALTER TABLE "documents" ADD CONSTRAINT "documents_profileId_fkey" FOREIGN KEY ("profileId") REFERENCES "profile"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "properties" ADD CONSTRAINT "properties_enderecoId_fkey" FOREIGN KEY ("enderecoId") REFERENCES "adress"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
