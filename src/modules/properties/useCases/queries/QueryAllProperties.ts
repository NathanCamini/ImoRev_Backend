import { prisma } from "../../../../prisma/client";
import { AppError } from "../../../../errors/AppError";

export class QueryAllProperties {
  async execute() {
    const queryAllPropertiesResult = await prisma.propriedades.findMany({
      include: {
        endereco: true,
      },
    });
    if (queryAllPropertiesResult.length === 0) {
      throw new AppError("Nenhuma propriedade foi encontrada!");
    }
    return queryAllPropertiesResult;
  }
}
