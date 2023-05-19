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

	getRank( {id} ){
		const query = {
			text : `
			SELECT u.id, u.name, COALESCE(SUM(ul.access),0) AS "visitCount",
				CASE
					WHEN COUNT(ul.id) > 0
					THEN json_agg(json_build_object('id', ul.id, 'shortUrl', ul."shortUrl", 'url', ul.url, 'visitCount', ul.access))
					ELSE NULL
				END AS "shortenedUrls"
				FROM users u
				LEFT JOIN urls ul ON u.id = ul."creatorId"
				WHERE u.id = $1
				GROUP BY u.id;
			`,
			values : [id]
		};
		
		return db.query( query );
	}
}

export default new UsersRepositories;