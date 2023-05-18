import usersRepositories from '../repositories/users.repositories.js';
import bcrypt from 'bcrypt';
import  Jwt  from 'jsonwebtoken';
class UsersControllers 
{
	async signUp( req, res ){
		const { name, email, password} = req.body;
		const hash = bcrypt.hashSync( password, 10 );
		try {
			await usersRepositories.create( {name, email, hash} );
			res.status( 201 ).send( {message: 'Usuário cadastrado!'} );
		} catch ( error ) {
			res.status( 500 ).send( {message : error.message} );
		}
	}

	async signIn( req, res ){

		const {id, name, email, password} = res.locals.user;
		const {signin} = res.locals;
		const correctPassword = bcrypt.compareSync( signin, password );

		if ( !correctPassword ) return res.status( 401 ).send( {message : 'Senha incorreta!'} );

		const payload = {id, name, email };
		const token = Jwt.sign( payload, process.env.JWT_SECRET );
		
		res.status( 200 ).send( {token} );
	}
}


export default new UsersControllers;