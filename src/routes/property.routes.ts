import { Router } from "express";
import { CreatePropertyController } from "../modules/properties/useCases/createProperties/CreatePropertyController";
import { DeletePropertyController } from "../modules/properties/useCases/deleteProperties/DeletePropertyController";

const createPropertyController = new CreatePropertyController();
const deletePropertyController = new DeletePropertyController();
const propertyRoutes = Router();


propertyRoutes.post("/", createPropertyController.handle);
propertyRoutes.delete("/delete/:id", deletePropertyController.handle);

export { propertyRoutes };