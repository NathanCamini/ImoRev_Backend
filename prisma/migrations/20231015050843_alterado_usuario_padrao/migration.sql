/*
  Warnings:

  - You are about to drop the column `imagem` on the `usuariopadrao` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE "usuariopadrao" DROP COLUMN "imagem",
ADD COLUMN     "imagem_link" TEXT;
