import { Router } from "express";
import { userRoutes } from "./user.routes";
import { propertyRoutes } from "./property.routes";
import { requestsRoutes } from "./request.routes";

const routes = Router();

routes.use("/users", userRoutes);
routes.use("/properties", propertyRoutes);
routes.use("/requests", requestsRoutes);

export { routes };