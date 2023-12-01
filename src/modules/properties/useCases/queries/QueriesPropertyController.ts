import { Request, Response } from "express";
import { QueryAllProperties } from "./QueryAllProperties";
import { QueryAProperty } from "./QueryAProperty";

export class QueriesPropertyController {
  async getAllProperties(req: Request, res: Response) {
    const queryAllProperties = new QueryAllProperties();
    const result = await queryAllProperties.execute();
    return res.json(result);
  }

  async getAProperty(req: Request, res: Response) {
    const queryAProperties = new QueryAProperty();
    const result = await queryAProperties.execute(req.params.id);
    return res.json(result);
  }

}
