import { UsuarioPadrao } from "@prisma/client";
import { prisma } from "../../../../prisma/client";
import { CreateUserDTO } from "../../dtos/CreateUserDTO";
import { AppError } from "../../../../errors/AppError";

export class CreateUserUseCase {
  async execute({
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
    endereco
  }: CreateUserDTO): Promise<UsuarioPadrao> {
    
    // Verificar email único
    const userAlreadyExists = await prisma.usuarioPadrao.findUnique({
      where: {
        email,
      },
    });
    if (userAlreadyExists) {
      throw new AppError("Usuário já existente");
    }

    // Criação do user com associacao de endereco
    const user = await prisma.usuarioPadrao.create({
      data: {
        email,
        senha: senhaCriptografada,
        telefone,
        genero,
        estado_civil,
        data_nascimento,
        nome_completo,
        permissao,
        imagem_link,
        inscricao_federal,
        endereco: {
          create: 
            endereco
          ,
        },
      },
    });
    return user;
  }
}
