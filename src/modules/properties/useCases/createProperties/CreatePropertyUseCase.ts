import { prisma } from "../../../../prisma/client";
import { CreatePropertyDTO } from "../../dtos/CreatePropertyDTO";
import { AppError } from "../../../../errors/AppError";
import { Properties } from "@prisma/client";

export class CreatePropertyUseCase {
  async execute({
    tipo,
    valorAvaliacao,
    valorAluguel,
    endereco
  }: CreatePropertyDTO): Promise<Properties> {

    console.log(endereco)

    const {rua,
      numero,
      complemento,
      cidade,
      bairro,
      uf,
      cep} = endereco;

    // Criação da propriedade associando-a ao endereço
    const property = await prisma.properties.create({
      data: {
        tipo: tipo,
        valorAvaliacao: valorAvaliacao,
        valorAluguel: valorAluguel,
        endereco: {
          create: 
            endereco
          ,
        },
      },
    });

    return property;
  }
}
