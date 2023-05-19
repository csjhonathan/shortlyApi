import  Jwt  from 'jsonwebtoken';
import usersRepositories from '../repositories/users.repositories.js';
export default async function tokenValidate( req, res, next ){
	const {authorization} = req.headers;
	const token = authorization?.split( ' ' )[1];
	const secretKey = process.env.JWT_SECRET || 'uma-chave-publica-para-o-bot';
	
	if( !token || !authorization ) return res.status( 401 ).send( {message:'Token válido necessário!'} );

	try {

		const {id, name, email} = Jwt.verify( token, secretKey );
		const {rows : [user]} = await usersRepositories.list( {email} );
		if( !user ) return res.status( 401 ).send( {message : 'Usuário não existe'} );
		res.locals.user = {id, name, email};

		next();
	} catch ( error ) {
		if( error.name === 'JsonWebTokenError' ){
			return res.status( 401 ).send( {message:'Token válido necessário!'} );
		}
		return res.status( 500 ).send( {message : error.message} );
	}
}