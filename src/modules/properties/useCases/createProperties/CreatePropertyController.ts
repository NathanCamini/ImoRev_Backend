import { Request, Response } from "express";
import { CreatePropertyUseCase } from "./CreatePropertyUseCase";

export class CreatePropertyController {
  async handle(req: Request, res: Response) {
    const {
      tipo,
      valorAvaliacao,
      valorAluguel,
      links
    } = req.body.data;

    const endereco = req.body.data.endereco;

    const createPropertyUseCase = new CreatePropertyUseCase();
    const result = await createPropertyUseCase.execute({
      tipo,
      valorAvaliacao,
      valorAluguel,
      endereco,
      links
    });

    return res.status(201).json(result);
  }
}