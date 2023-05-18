import { Router } from 'express';
import usersRouters from './users.routes.js';

const routes = Router();

routes.use( usersRouters );

export default routes;