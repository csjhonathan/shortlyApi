import  Jwt  from 'jsonwebtoken';

export default function tokenValidate( req, res, next ){
	const {authorization} = req.headers;
	const token = authorization?.split( ' ' )[1];
	const secretKey = process.env.JWT_SECRET || 'uma-chave-publica-para-o-bot';
	
	if( !token || !authorization ) return res.status( 401 ).send( {message:'Token válido necessário!'} );

	try {

		const {id, name, email} = Jwt.verify( token, secretKey );
		res.locals.user = {id, name, email};

		next();
	} catch ( error ) {
		return res.status( 500 ).send( {message : error.message} );
	}
}