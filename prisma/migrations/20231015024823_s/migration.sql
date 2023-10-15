/*
  Warnings:

  - You are about to drop the `adress` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "properties" DROP CONSTRAINT "properties_enderecoid_fkey";

-- DropTable
DROP TABLE "adress";

-- CreateTable
CREATE TABLE "address" (
    "id" SERIAL NOT NULL,
    "rua" TEXT NOT NULL,
    "numero" INTEGER NOT NULL,
    "complemento" TEXT,
    "cidade" TEXT NOT NULL,
    "bairro" TEXT NOT NULL,
    "uf" TEXT NOT NULL,
    "cep" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3),

    CONSTRAINT "address_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "properties" ADD CONSTRAINT "properties_enderecoid_fkey" FOREIGN KEY ("enderecoid") REFERENCES "address"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
