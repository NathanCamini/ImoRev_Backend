import { prisma } from "../../../../prisma/client";
import { AppError } from "../../../../errors/AppError";

export class QueryAllUsers {
  async execute() {
    const queryAllUsersResult = await prisma.usuarioPadrao.findMany();
    if (queryAllUsersResult.length === 0) {
      throw new AppError("Nenhum usuário foi encontrado!");
    }
    return queryAllUsersResult;
  }
}
