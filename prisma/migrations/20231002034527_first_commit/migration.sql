-- CreateEnum
CREATE TYPE "ROLE" AS ENUM ('ADMIN', 'IMOBILIARIA', 'LOCADOR', 'LOCATARIO');

-- CreateEnum
CREATE TYPE "TIPODOCUMENTO" AS ENUM ('CPF', 'CNPJ');

-- CreateEnum
CREATE TYPE "TIPOIMOVEL" AS ENUM ('CASA', 'APARTAMENTO', 'TERRENO', 'COMERCIAL');

-- CreateTable
CREATE TABLE "usuariosLogin" (
    "id" SERIAL NOT NULL,
    "email" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3),

    CONSTRAINT "usuariosLogin_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "usuariosDetalhes" (
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

    CONSTRAINT "usuariosDetalhes_pkey" PRIMARY KEY ("id","userId")
);

-- CreateTable
CREATE TABLE "documentos" (
    "id" SERIAL NOT NULL,
    "tipo" "TIPODOCUMENTO" NOT NULL,
    "numero" TEXT NOT NULL,
    "ProfileId" INTEGER NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3),

    CONSTRAINT "documentos_pkey" PRIMARY KEY ("id","ProfileId")
);

-- CreateTable
CREATE TABLE "enderecos" (
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

    CONSTRAINT "enderecos_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "imoveis" (
    "id" SERIAL NOT NULL,
    "enderecoId" INTEGER NOT NULL,
    "tipo" "TIPOIMOVEL" NOT NULL,
    "valorAvaliacao" DOUBLE PRECISION NOT NULL,
    "valorAluguel" DOUBLE PRECISION NOT NULL,
    "ProfileId" INTEGER NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3),

    CONSTRAINT "imoveis_pkey" PRIMARY KEY ("id","enderecoId")
);

-- CreateTable
CREATE TABLE "imagensImoveis" (
    "id" SERIAL NOT NULL,
    "link" TEXT NOT NULL,
    "imovelId" INTEGER NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3),

    CONSTRAINT "imagensImoveis_pkey" PRIMARY KEY ("id","imovelId")
);

-- CreateTable
CREATE TABLE "notificacoes" (
    "id" SERIAL NOT NULL,
    "remetenteId" INTEGER NOT NULL,
    "destinatarioId" INTEGER NOT NULL,
    "mensagem" TEXT NOT NULL,
    "lida" BOOLEAN NOT NULL DEFAULT false,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3),

    CONSTRAINT "notificacoes_pkey" PRIMARY KEY ("id","remetenteId","destinatarioId")
);

-- CreateIndex
CREATE UNIQUE INDEX "usuariosLogin_id_key" ON "usuariosLogin"("id");

-- CreateIndex
CREATE UNIQUE INDEX "usuariosLogin_email_key" ON "usuariosLogin"("email");

-- CreateIndex
CREATE UNIQUE INDEX "usuariosDetalhes_id_key" ON "usuariosDetalhes"("id");

-- CreateIndex
CREATE UNIQUE INDEX "usuariosDetalhes_email_key" ON "usuariosDetalhes"("email");

-- CreateIndex
CREATE UNIQUE INDEX "usuariosDetalhes_userId_key" ON "usuariosDetalhes"("userId");

-- CreateIndex
CREATE UNIQUE INDEX "documentos_id_key" ON "documentos"("id");

-- CreateIndex
CREATE UNIQUE INDEX "documentos_numero_key" ON "documentos"("numero");

-- CreateIndex
CREATE UNIQUE INDEX "imoveis_id_key" ON "imoveis"("id");

-- AddForeignKey
ALTER TABLE "usuariosDetalhes" ADD CONSTRAINT "usuariosDetalhes_enderecoId_fkey" FOREIGN KEY ("enderecoId") REFERENCES "enderecos"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "usuariosDetalhes" ADD CONSTRAINT "usuariosDetalhes_userId_fkey" FOREIGN KEY ("userId") REFERENCES "usuariosLogin"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "documentos" ADD CONSTRAINT "documentos_ProfileId_fkey" FOREIGN KEY ("ProfileId") REFERENCES "usuariosDetalhes"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "imoveis" ADD CONSTRAINT "imoveis_enderecoId_fkey" FOREIGN KEY ("enderecoId") REFERENCES "enderecos"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "imoveis" ADD CONSTRAINT "imoveis_ProfileId_fkey" FOREIGN KEY ("ProfileId") REFERENCES "usuariosDetalhes"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "imagensImoveis" ADD CONSTRAINT "imagensImoveis_imovelId_fkey" FOREIGN KEY ("imovelId") REFERENCES "imoveis"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "notificacoes" ADD CONSTRAINT "notificacoes_remetenteId_fkey" FOREIGN KEY ("remetenteId") REFERENCES "usuariosDetalhes"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "notificacoes" ADD CONSTRAINT "notificacoes_destinatarioId_fkey" FOREIGN KEY ("destinatarioId") REFERENCES "usuariosDetalhes"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
