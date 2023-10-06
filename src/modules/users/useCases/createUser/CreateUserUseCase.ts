import { User } from "@prisma/client";
import { prisma } from "../../../../prisma/client";
import { CreateUserDTO } from "../../dtos/CreateUserDTO";
import { AppError } from "../../../../errors/AppError";

export class CreateUserUseCase {
  async execute({ email, password, }: CreateUserDTO): Promise<User> {
    // Verificar email único
    const userAlreadyExists = await prisma.user.findUnique({
      where: {
        email,
      },
    });
    if (userAlreadyExists) {
        throw new AppError("Usuário já existente");
    }

    // Criação do user
    const user = await prisma.user.create({
      data: {
        email,
        password,
      },
    });
    return user;
  }
}
