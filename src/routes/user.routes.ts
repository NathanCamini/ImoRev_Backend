import { Router } from "express";
import { CreateUserController } from "../modules/users/useCases/createUser/CreateUserController";
import { DeleteUserController } from "../modules/users/useCases/deleteUser/DeleteUserController";
import { QueriesUserController } from "../modules/users/useCases/queries/QueriesUserController";

const createUserController = new CreateUserController();
const deleteUserController = new DeleteUserController();
const queriesUserController = new QueriesUserController();
const userRoutes = Router();

userRoutes.post("/", createUserController.handle);
userRoutes.get("/getAllUsers", queriesUserController.getAllUsers);
userRoutes.delete("/delete/:id", deleteUserController.handle);

export { userRoutes };
