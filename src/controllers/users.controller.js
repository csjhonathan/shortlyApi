import usersRepositories from '../repositories/users.repositories.js';
import bcrypt from 'bcrypt';
class UsersControllers 
{
	async create( req, res ){
		const {name, email, password} = req.body;
		const hash = bcrypt.hashSync( password, 10 );
		try {
			await usersRepositories.create( {name, email, hash} );
			res.status( 201 ).send( {message: 'Usuário cadastrado!'} );
		} catch ( error ) {
			res.status( 500 ).send( {message : error.message} );
		}
	}
}


export default new UsersControllers;