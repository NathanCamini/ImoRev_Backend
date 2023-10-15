import { ROLE } from "@prisma/client";

export interface CreateUserDTO {
  email: string;
  senhaCriptografada: string;
  telefone: string;
  genero: string;
  estado_civil: string;
  data_nascimento: Date;
  nome_completo: string;
  permissao: ROLE;
  imagem_link: string;
  inscricao_federal: string;

  endereco: {
    rua: string;
    numero: number;
    complemento?: string;
    cidade: string;
    bairro: string;
    uf: string;
    cep: string;
  }
}
