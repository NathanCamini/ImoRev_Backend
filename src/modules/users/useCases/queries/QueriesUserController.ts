import { Request, Response } from "express";
import { QueryAllUsers } from "./QueryAllUsers";

export class QueriesUserController {
  async getAllUsers(req: Request, res: Response) {
    const queryAllUsers = new QueryAllUsers();
    const result = await queryAllUsers.execute();
    return res.json(result);
  }
}
