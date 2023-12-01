import { Router } from "express";
import { CreateRequestController } from "../modules/requests/useCases/createRequest/CreateRequestController";

const createRequestController = new CreateRequestController();

const requestsRoutes = Router();

requestsRoutes.post("/create", createRequestController.handle);

export { requestsRoutes };

