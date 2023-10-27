import { Router } from "express";
import { CreateUserController } from "../modules/users/useCases/createUser/CreateUserController";
import { DeleteUserController } from "../modules/users/useCases/deleteUser/DeleteUserController";

const createUserController = new CreateUserController();
const deleteUserController = new DeleteUserController();
const userRoutes = Router();

userRoutes.post("/", createUserController.handle);
userRoutes.delete("/delete/:id", deleteUserController.handle);

export { userRoutes };
