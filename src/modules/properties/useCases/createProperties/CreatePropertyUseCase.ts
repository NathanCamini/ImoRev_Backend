import { Propriedades } from "@prisma/client";
import { prisma } from "../../../../prisma/client";
import { CreatePropertyDTO } from "../../dtos/CreatePropertyDTO";
import { AppError } from "../../../../errors/AppError";

export class CreatePropertyUseCase {
  async execute({
    tipo,
    valorAvaliacao,
    valorAluguel,
    links,
    endereco,
  }: CreatePropertyDTO): Promise<Propriedades> {
    
    // Criação da propriedade associando-a ao endereço
    const property = await prisma.propriedades.create({
      data: {
        tipo: tipo,
        valorAvaliacao: valorAvaliacao,
        valorAluguel: valorAluguel,
        links: links,
        endereco: {
          create: endereco,
        },
      },
    });

    return property;
  }
}
