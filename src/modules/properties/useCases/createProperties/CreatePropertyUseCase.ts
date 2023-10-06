import { Properties } from "@prisma/client";
import { prisma } from "../../../../prisma/client";
import { CreatePropertyDTO } from "../../dtos/CreatePropertyDTO";
import { AppError } from "../../../../errors/AppError";

export class CreatePropertyUseCase {
  async execute({
    tipo,
    valorAvaliacao,
    valorAluguel,
    // rua,
    // numero,
    // complemento,
    // cidade,
    // bairro,
    // uf,
    // cep,
  }: CreatePropertyDTO): Promise<Properties> {
    // Verificar se já existe a propriedade
    // const propertyAlreadyExists = await prisma.user.findUnique({
    //   where: {
    //     email,
    //   },
    // });
    // if (userAlreadyExists) {
    //     throw new AppError("Usuário já existente");
    // }

    // Criação do imovel
    const property = await prisma.properties.create({
      data: {
        tipo,
        valorAvaliacao,
        valorAluguel,
      },
    });
    
    return property;
  }
}

// endereco: {
//   create: {
//     rua,
//     numero,
//     complemento,
//     cidade,
//     bairro,
//     uf,
//     cep,
//   },
// },