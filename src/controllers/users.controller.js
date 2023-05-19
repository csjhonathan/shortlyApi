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
		const secretKey = process.env.JWT_SECRET || 'uma-chave-publica-para-o-bot';
		const token = Jwt.sign( payload, secretKey );
		
		res.status( 200 ).send( {token} );
	}

	async getMyAccess( req, res ){

		const {id, name, email} = res.locals.user;

		try {
			const {rows:[myRank]} = await usersRepositories.getRank( {id} );
			if( !myRank.shortenedUrls ){
				myRank.shortenedUrls = [];
			}
			res.status( 200 ).send( myRank );
		} catch ( error ) {
			res.status( 500 ).send( {message : error.message} );
		}
	}
}


export default new UsersControllers;