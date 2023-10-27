import { prisma } from "../../../../prisma/client";
import { DeleteUserDTO } from "../../dtos/DeleteUserDTO";
import { AppError } from "../../../../errors/AppError";

export class DeleteUserUseCase {
  async execute({ id }: DeleteUserDTO): Promise<DeleteUserDTO> {

    // Caso não tenha o usuário
    const userAlreadyExists = await prisma.usuarioPadrao.findUnique({
      where: {
        id: id,
      },
    });
    if (!userAlreadyExists) {
      throw new AppError("Usuário não encontrado");
    }

    // Consulta o endereco relacionado
    const enderecoQuery = await prisma.usuarioPadrao.findUnique({
      select: { enderecoId: true },
      where: { id: id },
    });

    // Deletar usuário
    const user = await prisma.usuarioPadrao.delete({
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

    return user;
  }
}
