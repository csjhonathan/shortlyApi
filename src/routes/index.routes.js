import { Router } from 'express';
import usersRouters from './users.routes.js';
import urlsRouters from './urls.routes.js';
import rankingRoutes from './ranking.routes.js';

const routes = Router();

routes.use( rankingRoutes );
routes.use( urlsRouters );
routes.use( usersRouters );

export default routes;