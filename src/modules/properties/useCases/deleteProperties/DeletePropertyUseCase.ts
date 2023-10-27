import { prisma } from "../../../../prisma/client";
import { DeletePropertyDTO } from "../../dtos/DeletePropertyDTO";
import { AppError } from "../../../../errors/AppError";

export class DeletePropertyUseCase {
  async execute({ id }: DeletePropertyDTO): Promise<DeletePropertyDTO> {

    // Caso não tenha a propriedade
    const propertyAlreadyExists = await prisma.propriedades.findUnique({
      where: {
        id: id,
      },
    });
    if (!propertyAlreadyExists) {
      throw new AppError("Propriedade não encontrada");
    }

    // Consulta o endereco relacionado
    const enderecoQuery = await prisma.propriedades.findUnique({
      select: { enderecoId: true },
      where: { id: id },
    });

    // Deletar propriedade
    const property = await prisma.propriedades.delete({
      where: {
        id: id,
      },
    });

    // Deletar endereco relacionado
    const endereco = await prisma.endereco.delete({
      where: {
        id: enderecoQuery?.enderecoId,
      },
    });

    return property;
  }
}
