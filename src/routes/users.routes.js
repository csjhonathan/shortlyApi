import { Router } from 'express';
import usersController from '../controllers/users.controller.js';
const usersRouters = Router();

usersRouters.post( '/signup' );
usersRouters.post( '/signin' );
usersRouters.get( '/users/:id', usersController.list );


export default usersRouters;