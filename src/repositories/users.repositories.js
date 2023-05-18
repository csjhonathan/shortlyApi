import db from '../database/database-conncetion.js';

class UsersRepositories
{
	
	create( {name, email, hash} ){
		const query = {
			text : `
				INSERT INTO users (name, email, password)
				VALUES ($1, $2, $3)
			`,
			values : [name, email, hash]
		};

		return db.query( query );
	}

	list( {email} ){
		const query = {
			text : `
				SELECT * FROM users 
				WHERE TRUE
			`,
			values : []
		};
		
		if( email ){
			query.values.push( email );
			query.text+= `AND email = $${query.values.length}`;
		}
		return db.query( query );
	}
}

export default new UsersRepositories;