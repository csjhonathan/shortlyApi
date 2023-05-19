import { Router } from 'express';
import usersController from '../controllers/users.controller.js';
import { signUpSchema, signInSchema } from '../schemas/auth.schema.js';
import schemaValidate from '../middlewares/schemas.validate.middleware.js';
import userExist from '../middlewares/userExist.middleware.js';
import tokenValidate from '../middlewares/token.validate.middleware.js';
const usersRouters = Router();

usersRouters.post( '/signup', schemaValidate( signUpSchema ), userExist, usersController.signUp );
usersRouters.post( '/signin', schemaValidate( signInSchema ), userExist, usersController.signIn );
usersRouters.get( '/users/:id' );
usersRouters.get( '/users/me', tokenValidate, usersController.getMyAccess );


export default usersRouters;