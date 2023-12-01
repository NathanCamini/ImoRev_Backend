import { Router } from "express";
import { CreatePropertyController } from "../modules/properties/useCases/createProperties/CreatePropertyController";
import { DeletePropertyController } from "../modules/properties/useCases/deleteProperties/DeletePropertyController";
import { QueriesPropertyController } from "../modules/properties/useCases/queries/QueriesPropertyController";

const createPropertyController = new CreatePropertyController();
const deletePropertyController = new DeletePropertyController();
const queriesPropertyController = new QueriesPropertyController();

const propertyRoutes = Router();

propertyRoutes.post("/", createPropertyController.handle);
propertyRoutes.get("/getAllProperties", queriesPropertyController.getAllProperties);
propertyRoutes.get("/getAProperty/:id", queriesPropertyController.getAProperty);
propertyRoutes.delete("/delete/:id", deletePropertyController.handle);

export { propertyRoutes };

