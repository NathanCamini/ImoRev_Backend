import { Router } from "express";
import { userRoutes } from "./user.routes";
import { propertyRoutes } from "./property.routes";

const routes = Router();

routes.use("/users", userRoutes);
routes.use("/properties", propertyRoutes);

export { routes };