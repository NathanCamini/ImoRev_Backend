/*
  Warnings:

  - A unique constraint covering the columns `[enderecoId]` on the table `properties` will be added. If there are existing duplicate values, this will fail.

*/
-- CreateIndex
CREATE UNIQUE INDEX "properties_enderecoId_key" ON "properties"("enderecoId");
