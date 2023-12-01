import { Request, Response } from "express";
import { CreateRequestUseCase } from "./CreateRequestUseCase";

export class CreateRequestController {
  async handle(req: Request, res: Response) {
    const { descricao, tipo, requisitante } = req.body.data;
    const createRequestUseCase = new CreateRequestUseCase();
    const result = await createRequestUseCase.execute({descricao, tipo, requisitante});

    return res.status(201).json(result);
  }
}
