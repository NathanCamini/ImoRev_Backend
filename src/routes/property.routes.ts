import { Router } from "express";
import { CreatePropertyController } from "../modules/properties/useCases/createProperties/CreatePropertyController";

const createPropertyController = new CreatePropertyController();
const propertyRoutes = Router();


propertyRoutes.post("/", createPropertyController.handle);

export { propertyRoutes };