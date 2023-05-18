import Joi from 'joi';

export const signUpSchema = Joi.object( {
	name : Joi
		.string()
		.required(),
	email : Joi
		.string()
		.email()
		.required(),
	password : Joi
		.string()
		.required(),
	confirmPassword : Joi
		.string()
		.valid( Joi.ref( 'password' ) )
		.required()
		.messages( {'any.only' : 'Senhas não coincidem'} )
} );


export const signInSchema = Joi.object( {
	email : Joi
		.string()
		.email()
		.required(),
	password : Joi
		.string()
		.required()
} );