import { Request, Response } from "express";
import { DeletePropertyUseCase } from "./DeletePropertyUseCase";

export class DeletePropertyController {
  async handle(req: Request, res: Response) {
    const { id } = req.params;

    const deletePropertyUseCase = new DeletePropertyUseCase();
    const result = await deletePropertyUseCase.execute({
      id,
    });

    return res.status(201).json(result);
  }
}
