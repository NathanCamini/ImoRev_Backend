import { Request, Response } from "express";
import { CreatePropertyUseCase } from "./CreatePropertyUseCase";

export class CreatePropertyController {
  async handle(req: Request, res: Response) {
    const {
      tipo,
      valorAvaliacao,
      valorAluguel,
    } = req.body;

    const createPropertyUseCase = new CreatePropertyUseCase();
    const result = await createPropertyUseCase.execute({
      tipo,
      valorAvaliacao,
      valorAluguel,
    });

    return res.status(201).json(result);
  }
}


// rua,
// numero,
// complemento,
// cidade,
// bairro,
// uf,
// cep,
// link,


// teste:
// {
// 	"tipo": "CASA",
	
// 	"valorAvaliacao": 350000,
// 	"valorAluguel": 1500,
	
// 	"rua": "Rua dos bobos",
// 	"numero": 300,
// 	"complemento": "bloco b",
// 	"cidade": "bento gonçalves",
// 	"bairro": "sao roque",
// 	"uf": "uf",
// 	"cep": "cep123",
// 	"link": "link132",
// 	"profileId": 1
// }