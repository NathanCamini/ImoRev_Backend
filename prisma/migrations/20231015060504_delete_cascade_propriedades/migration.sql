/*
  Warnings:

  - You are about to drop the `usuariopadrao` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "propriedades" DROP CONSTRAINT "propriedades_enderecoId_fkey";

-- DropForeignKey
ALTER TABLE "usuariopadrao" DROP CONSTRAINT "usuariopadrao_enderecoId_fkey";

-- DropTable
DROP TABLE "usuariopadrao";

-- CreateTable
CREATE TABLE "usuario_padrao" (
    "id" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "senha" TEXT NOT NULL,
    "telefone" TEXT NOT NULL,
    "genero" TEXT NOT NULL,
    "estado_civil" TEXT NOT NULL,
    "data_nascimento" TIMESTAMP(3) NOT NULL,
    "nome_completo" TEXT NOT NULL,
    "permissao" "ROLE" NOT NULL,
    "imagem_link" TEXT,
    "inscricao_federal" TEXT NOT NULL,
    "enderecoId" TEXT NOT NULL,
    "criado_em" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "atualizado_em" TIMESTAMP(3),

    CONSTRAINT "usuario_padrao_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "usuario_padrao_id_key" ON "usuario_padrao"("id");

-- CreateIndex
CREATE UNIQUE INDEX "usuario_padrao_email_key" ON "usuario_padrao"("email");

-- CreateIndex
CREATE UNIQUE INDEX "usuario_padrao_enderecoId_key" ON "usuario_padrao"("enderecoId");

-- AddForeignKey
ALTER TABLE "usuario_padrao" ADD CONSTRAINT "usuario_padrao_enderecoId_fkey" FOREIGN KEY ("enderecoId") REFERENCES "endereco"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "propriedades" ADD CONSTRAINT "propriedades_enderecoId_fkey" FOREIGN KEY ("enderecoId") REFERENCES "endereco"("id") ON DELETE CASCADE ON UPDATE CASCADE;
