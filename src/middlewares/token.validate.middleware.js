import  Jwt  from 'jsonwebtoken';

export default function tokenValidate( req, res, next ){
	const {authorization} = req.headers;
	const token = authorization.split( ' ' )[1];

	if( !token || !authorization ) return res.status( 401 ).send( {message:'Token válido necessário!'} );

	try {

		const {id, name, email} = Jwt.verify( token, process.env.JWT_SECRET );
		res.locals.user = {id, name, email};

		next();
	} catch ( error ) {
		return res.status( 500 ).send( {message : error.message} );
	}
}