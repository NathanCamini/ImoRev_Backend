import { Requests, TYPESERVICE } from "@prisma/client";
import { prisma } from "../../../../prisma/client";

type CreateRequestTypes = {
  descricao: string;
  tipo: TYPESERVICE;
  requisitante: string;
};

export class CreateRequestUseCase {
  async execute({ descricao, tipo, requisitante }: CreateRequestTypes) {
    const request = await prisma.requests.create({
      data: {
        description: descricao,
        tipoServico: tipo,
        requisitante: {
          connect: { id: requisitante },
        },
      },
    });
    return request;
  }
}
