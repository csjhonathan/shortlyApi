import { Router } from 'express';
import usersRouters from './users.routes.js';
import urlsRouters from './urls.routes.js';
import rankingRoutes from './ranking.routes.js';

const routes = Router();

routes.get( '/keep-up', ( req, res ) => res.sendStatus( 200 ) );
routes.use( rankingRoutes );
routes.use( urlsRouters );
routes.use( usersRouters );

export default routes;