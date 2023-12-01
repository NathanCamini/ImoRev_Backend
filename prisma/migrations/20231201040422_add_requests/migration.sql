-- CreateEnum
CREATE TYPE "TYPESERVICE" AS ENUM ('MANUTENCAO_ELETRICA', 'MANUTENCAO_PREDIAL');

-- CreateTable
CREATE TABLE "Requests" (
    "id" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "tipoServico" "TYPESERVICE" NOT NULL,
    "requisitanteId" TEXT NOT NULL,

    CONSTRAINT "Requests_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Requests_id_key" ON "Requests"("id");

-- AddForeignKey
ALTER TABLE "Requests" ADD CONSTRAINT "Requests_requisitanteId_fkey" FOREIGN KEY ("requisitanteId") REFERENCES "usuario_padrao"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
