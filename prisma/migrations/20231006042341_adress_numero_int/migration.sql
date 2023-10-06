/*
  Warnings:

  - Changed the type of `numero` on the `adress` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.

*/
-- AlterTable
ALTER TABLE "adress" DROP COLUMN "numero",
ADD COLUMN     "numero" INTEGER NOT NULL;
