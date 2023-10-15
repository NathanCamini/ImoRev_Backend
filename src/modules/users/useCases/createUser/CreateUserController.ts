import { Request, Response } from "express";
import { CreateUserUseCase } from "./CreateUserUseCase";

export class CreateUserController {
  async handle(req: Request, res: Response) {
    const {
      email,
      senha,
      telefone,
      genero,
      estado_civil,
      data_nascimento,
      nome_completo,
      permissao,
      imagem_link,
      inscricao_federal,
    } = req.body.data;

    const bcrypt = require ('bcrypt');
    const senhaCriptografada: string = await bcrypt.hash(senha, 10);

    const endereco = req.body.data.endereco;

    const createUserUseCase = new CreateUserUseCase();
    const result = await createUserUseCase.execute({
      email,
      senhaCriptografada,
      telefone,
      genero,
      estado_civil,
      data_nascimento,
      nome_completo,
      permissao,
      imagem_link,
      inscricao_federal,
      endereco,
    });

    return res.status(201).json(result);
  }
}
