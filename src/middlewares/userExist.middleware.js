import usersRepositories from '../repositories/users.repositories.js';

export default async function userExist ( req, res, next ){

	const { email } = req.body;
	const { path } = req;

	try {
		const {rows : [user]} = await usersRepositories.list( {email} );

		if( path === '/signup' && user ) return res.status( 409 ).send( {message : 'Email em uso!'} );

		if( path === '/signin' && !user )	return res.status( 401 ).send( {message : 'Usuário não existe'} );

		res.locals.user = user;
		res.locals.signin = req.body.password;
	} catch ( error ) {
		res.status( 500 ).send( {message:error.message} );
	}

	next();
}