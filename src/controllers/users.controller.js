import usersRepositories from '../repositories/users.repositories.js';

class UsersControllers 
{
	async list( req, res ){
		try {
			const {rows : users} = await usersRepositories.list();
			res.send( users );
		} catch ( error ) {
			res.status( 500 ).send( {message : error.message} );
		}
	}
}


export default new UsersControllers;