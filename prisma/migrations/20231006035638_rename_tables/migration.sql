/*
  Warnings:

  - You are about to drop the `documentos` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `enderecos` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `imagensImoveis` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `imoveis` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `notificacoes` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `usuariosDetalhes` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `usuariosLogin` table. If the table is not empty, all the data it contains will be lost.

*/
-- CreateEnum
CREATE TYPE "TYPEDOCUMENTS" AS ENUM ('CPF', 'CNPJ');

-- CreateEnum
CREATE TYPE "TYPEPROPERTY" AS ENUM ('CASA', 'APARTAMENTO', 'TERRENO', 'COMERCIAL');

-- DropForeignKey
ALTER TABLE "documentos" DROP CONSTRAINT "documentos_ProfileId_fkey";

-- DropForeignKey
ALTER TABLE "imagensImoveis" DROP CONSTRAINT "imagensImoveis_imovelId_fkey";

-- DropForeignKey
ALTER TABLE "imoveis" DROP CONSTRAINT "imoveis_ProfileId_fkey";

-- DropForeignKey
ALTER TABLE "imoveis" DROP CONSTRAINT "imoveis_enderecoId_fkey";

-- DropForeignKey
ALTER TABLE "notificacoes" DROP CONSTRAINT "notificacoes_destinatarioId_fkey";

-- DropForeignKey
ALTER TABLE "notificacoes" DROP CONSTRAINT "notificacoes_remetenteId_fkey";

-- DropForeignKey
ALTER TABLE "usuariosDetalhes" DROP CONSTRAINT "usuariosDetalhes_enderecoId_fkey";

-- DropForeignKey
ALTER TABLE "usuariosDetalhes" DROP CONSTRAINT "usuariosDetalhes_userId_fkey";

-- DropTable
DROP TABLE "documentos";

-- DropTable
DROP TABLE "enderecos";

-- DropTable
DROP TABLE "imagensImoveis";

-- DropTable
DROP TABLE "imoveis";

-- DropTable
DROP TABLE "notificacoes";

-- DropTable
DROP TABLE "usuariosDetalhes";

-- DropTable
DROP TABLE "usuariosLogin";

-- DropEnum
DROP TYPE "TIPODOCUMENTO";

-- DropEnum
DROP TYPE "TIPOIMOVEL";

-- CreateTable
CREATE TABLE "user" (
    "id" SERIAL NOT NULL,
    "email" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3),

    CONSTRAINT "user_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "profile" (
    "id" SERIAL NOT NULL,
    "telefone" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "genero" TEXT NOT NULL,
    "estadocivil" TEXT NOT NULL,
    "dataNascimento" TIMESTAMP(3) NOT NULL,
    "nomeCompleto" TEXT NOT NULL,
    "role" "ROLE" NOT NULL,
    "enderecoId" INTEGER NOT NULL,
    "imagem" TEXT,
    "userId" INTEGER NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3),

    CONSTRAINT "profile_pkey" PRIMARY KEY ("id","userId")
);

-- CreateTable
CREATE TABLE "documents" (
    "id" SERIAL NOT NULL,
    "tipo" "TYPEDOCUMENTS" NOT NULL,
    "numero" TEXT NOT NULL,
    "ProfileId" INTEGER NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3),

    CONSTRAINT "documents_pkey" PRIMARY KEY ("id","ProfileId")
);

-- CreateTable
CREATE TABLE "adress" (
    "id" SERIAL NOT NULL,
    "rua" TEXT NOT NULL,
    "numero" TEXT NOT NULL,
    "complemento" TEXT,
    "cidade" TEXT NOT NULL,
    "bairro" TEXT NOT NULL,
    "uf" TEXT NOT NULL,
    "cep" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3),

    CONSTRAINT "adress_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "properties" (
    "id" SERIAL NOT NULL,
    "enderecoId" INTEGER NOT NULL,
    "tipo" "TYPEPROPERTY" NOT NULL,
    "valorAvaliacao" DOUBLE PRECISION NOT NULL,
    "valorAluguel" DOUBLE PRECISION NOT NULL,
    "ProfileId" INTEGER NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3),

    CONSTRAINT "properties_pkey" PRIMARY KEY ("id","enderecoId")
);

-- CreateTable
CREATE TABLE "image_properties" (
    "id" SERIAL NOT NULL,
    "link" TEXT NOT NULL,
    "imovelId" INTEGER NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3),

    CONSTRAINT "image_properties_pkey" PRIMARY KEY ("id","imovelId")
);

-- CreateTable
CREATE TABLE "notifications" (
    "id" SERIAL NOT NULL,
    "remetenteId" INTEGER NOT NULL,
    "destinatarioId" INTEGER NOT NULL,
    "mensagem" TEXT NOT NULL,
    "lida" BOOLEAN NOT NULL DEFAULT false,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3),

    CONSTRAINT "notifications_pkey" PRIMARY KEY ("id","remetenteId","destinatarioId")
);

-- CreateIndex
CREATE UNIQUE INDEX "user_id_key" ON "user"("id");

-- CreateIndex
CREATE UNIQUE INDEX "user_email_key" ON "user"("email");

-- CreateIndex
CREATE UNIQUE INDEX "profile_id_key" ON "profile"("id");

-- CreateIndex
CREATE UNIQUE INDEX "profile_email_key" ON "profile"("email");

-- CreateIndex
CREATE UNIQUE INDEX "profile_userId_key" ON "profile"("userId");

-- CreateIndex
CREATE UNIQUE INDEX "documents_id_key" ON "documents"("id");

-- CreateIndex
CREATE UNIQUE INDEX "documents_numero_key" ON "documents"("numero");

-- CreateIndex
CREATE UNIQUE INDEX "properties_id_key" ON "properties"("id");

-- AddForeignKey
ALTER TABLE "profile" ADD CONSTRAINT "profile_enderecoId_fkey" FOREIGN KEY ("enderecoId") REFERENCES "adress"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "profile" ADD CONSTRAINT "profile_userId_fkey" FOREIGN KEY ("userId") REFERENCES "user"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "documents" ADD CONSTRAINT "documents_ProfileId_fkey" FOREIGN KEY ("ProfileId") REFERENCES "profile"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "properties" ADD CONSTRAINT "properties_enderecoId_fkey" FOREIGN KEY ("enderecoId") REFERENCES "adress"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "properties" ADD CONSTRAINT "properties_ProfileId_fkey" FOREIGN KEY ("ProfileId") REFERENCES "profile"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "image_properties" ADD CONSTRAINT "image_properties_imovelId_fkey" FOREIGN KEY ("imovelId") REFERENCES "properties"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "notifications" ADD CONSTRAINT "notifications_remetenteId_fkey" FOREIGN KEY ("remetenteId") REFERENCES "profile"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "notifications" ADD CONSTRAINT "notifications_destinatarioId_fkey" FOREIGN KEY ("destinatarioId") REFERENCES "profile"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
