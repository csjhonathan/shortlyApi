import { Router } from 'express';
import schemaValidate from '../middlewares/schemas.validate.middleware.js';
import userExist from '../middlewares/userExist.middleware.js';
import { urlSchema } from '../schemas/url.schema.js';
import urlsControllers from '../controllers/urls.controllers.js';
import tokenValidate from '../middlewares/token.validate.middleware.js';
const urlsRouters = Router();

urlsRouters.post( '/urls/shorten', tokenValidate, schemaValidate( urlSchema ), urlsControllers.creat );
urlsRouters.get( '/urls/:id', urlsControllers.listById );
urlsRouters.get( '/urls/open/:shortUrl', urlsControllers.read );

export default urlsRouters;