import usersRepositories from '../repositories/users.repositories.js';

export default async function userExist ( req, res, next ){
	const { email } = req.body;

	try {
		const {rows : [user]} = await usersRepositories.list( {email} );
		if( user ) return res.status( 409 ).send( {message : 'Email em uso!'} );
	} catch ( error ) {
		res.status( 500 ).send( {message:error.message} );
	}

	next();
}