import { Request, Response } from "express";
import { QueryAllProperties } from "./QueryAllProperties";

export class QueriesPropertyController {
  async getAllProperties(req: Request, res: Response) {
    const queryAllProperties = new QueryAllProperties();
    const result = await queryAllProperties.execute();
    return res.json(result);
  }
}
