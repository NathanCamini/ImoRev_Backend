import { Propriedades } from "@prisma/client";
import { prisma } from "../../../../prisma/client";
import { CreatePropertyDTO } from "../../dtos/CreatePropertyDTO";
import { AppError } from "../../../../errors/AppError";

export class CreatePropertyUseCase {
  async execute({
    matricula,
    tipo,
    valorAvaliacao,
    valorAluguel,
    links,
    endereco,
    proprietario,
  }: CreatePropertyDTO): Promise<Propriedades> {

    // Criação da propriedade associando-a ao endereço e ao proprietário
    const property = await prisma.propriedades.create({
      data: {
        tipo: tipo,
        valorAvaliacao: valorAvaliacao,
        valorAluguel: valorAluguel,
        links: links,
        matricula: matricula,
        endereco: {
          create: endereco,
        },
        proprietario: {
          connect: { id: proprietario },
        },
      },
    });

    return property;
  }
}
