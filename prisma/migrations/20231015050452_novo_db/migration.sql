/*
  Warnings:

  - You are about to drop the `address` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `documents` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `image_properties` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `notifications` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `profile` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `properties` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `user` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "documents" DROP CONSTRAINT "documents_profileId_fkey";

-- DropForeignKey
ALTER TABLE "notifications" DROP CONSTRAINT "notifications_destinatarioId_fkey";

-- DropForeignKey
ALTER TABLE "notifications" DROP CONSTRAINT "notifications_remetenteId_fkey";

-- DropForeignKey
ALTER TABLE "profile" DROP CONSTRAINT "profile_userId_fkey";

-- DropForeignKey
ALTER TABLE "properties" DROP CONSTRAINT "properties_enderecoid_fkey";

-- DropTable
DROP TABLE "address";

-- DropTable
DROP TABLE "documents";

-- DropTable
DROP TABLE "image_properties";

-- DropTable
DROP TABLE "notifications";

-- DropTable
DROP TABLE "profile";

-- DropTable
DROP TABLE "properties";

-- DropTable
DROP TABLE "user";

-- DropEnum
DROP TYPE "TYPEDOCUMENTS";

-- CreateTable
CREATE TABLE "usuariopadrao" (
    "id" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "senha" TEXT NOT NULL,
    "telefone" TEXT NOT NULL,
    "genero" TEXT NOT NULL,
    "estado_civil" TEXT NOT NULL,
    "data_nascimento" TIMESTAMP(3) NOT NULL,
    "nome_completo" TEXT NOT NULL,
    "permissao" "ROLE" NOT NULL,
    "imagem" TEXT,
    "inscricao_federal" TEXT NOT NULL,
    "criado_em" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "atualizado_em" TIMESTAMP(3),
    "enderecoId" TEXT NOT NULL,

    CONSTRAINT "usuariopadrao_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "endereco" (
    "id" TEXT NOT NULL,
    "rua" TEXT NOT NULL,
    "numero" INTEGER NOT NULL,
    "complemento" TEXT,
    "cidade" TEXT NOT NULL,
    "bairro" TEXT NOT NULL,
    "uf" TEXT NOT NULL,
    "cep" TEXT NOT NULL,
    "criado_em" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "atualizado_em" TIMESTAMP(3),

    CONSTRAINT "endereco_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "propriedades" (
    "id" TEXT NOT NULL,
    "tipo" "TYPEPROPERTY" NOT NULL,
    "valorAvaliacao" DOUBLE PRECISION NOT NULL,
    "valorAluguel" DOUBLE PRECISION NOT NULL,
    "criado_em" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "atualizado_em" TIMESTAMP(3),
    "enderecoId" TEXT NOT NULL,
    "links" TEXT[],

    CONSTRAINT "propriedades_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "usuariopadrao_id_key" ON "usuariopadrao"("id");

-- CreateIndex
CREATE UNIQUE INDEX "usuariopadrao_email_key" ON "usuariopadrao"("email");

-- CreateIndex
CREATE UNIQUE INDEX "usuariopadrao_enderecoId_key" ON "usuariopadrao"("enderecoId");

-- CreateIndex
CREATE UNIQUE INDEX "propriedades_id_key" ON "propriedades"("id");

-- CreateIndex
CREATE UNIQUE INDEX "propriedades_enderecoId_key" ON "propriedades"("enderecoId");

-- AddForeignKey
ALTER TABLE "usuariopadrao" ADD CONSTRAINT "usuariopadrao_enderecoId_fkey" FOREIGN KEY ("enderecoId") REFERENCES "endereco"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "propriedades" ADD CONSTRAINT "propriedades_enderecoId_fkey" FOREIGN KEY ("enderecoId") REFERENCES "endereco"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
