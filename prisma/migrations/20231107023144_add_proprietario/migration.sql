/*
  Warnings:

  - Added the required column `matricula` to the `propriedades` table without a default value. This is not possible if the table is not empty.
  - Added the required column `proprietarioId` to the `propriedades` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "propriedades" ADD COLUMN     "matricula" INTEGER NOT NULL,
ADD COLUMN     "proprietarioId" TEXT NOT NULL;

-- AddForeignKey
ALTER TABLE "propriedades" ADD CONSTRAINT "propriedades_proprietarioId_fkey" FOREIGN KEY ("proprietarioId") REFERENCES "usuario_padrao"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
