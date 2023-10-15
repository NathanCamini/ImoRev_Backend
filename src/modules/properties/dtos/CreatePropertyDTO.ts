import { TYPEPROPERTY } from "@prisma/client";

export interface CreatePropertyDTO {
  valorAvaliacao: number;
  valorAluguel: number;

  // profileId: number;
  
  tipo: TYPEPROPERTY;
  
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