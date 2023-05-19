import { Router } from 'express';
import rankingControllers from '../controllers/ranking.controllers.js';

const rankingRoutes = Router();

rankingRoutes.get( '/ranking', rankingControllers.list );

export default rankingRoutes;