import { prisma } from "../../../../prisma/client";

export class QueryAProperty {
  async execute(id) {
    const queryAPropertiesResult = await prisma.propriedades.findUnique({
        where: { 
            id
        }
    });
    return queryAPropertiesResult;
  }
}
