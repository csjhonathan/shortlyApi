import { Router } from 'express';
import usersRouters from './users.routes.js';
import urlsRouters from './urls.routes.js';

const routes = Router();

routes.use( urlsRouters );
routes.use( usersRouters );

export default routes;