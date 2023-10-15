import { TYPEPROPERTY } from "@prisma/client";

export interface CreatePropertyDTO {  
  valorAvaliacao: number;
  valorAluguel: number;
  tipo: TYPEPROPERTY;
  links: string[];
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
  