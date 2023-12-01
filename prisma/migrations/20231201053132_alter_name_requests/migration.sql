/*
  Warnings:

  - You are about to drop the `Requests` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "Requests" DROP CONSTRAINT "Requests_requisitanteId_fkey";

-- DropTable
DROP TABLE "Requests";

-- CreateTable
CREATE TABLE "requests" (
    "id" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "tipoServico" "TYPESERVICE" NOT NULL,
    "requisitanteId" TEXT NOT NULL,

    CONSTRAINT "requests_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "requests_id_key" ON "requests"("id");

-- AddForeignKey
ALTER TABLE "requests" ADD CONSTRAINT "requests_requisitanteId_fkey" FOREIGN KEY ("requisitanteId") REFERENCES "usuario_padrao"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
