import db from '../database/database-conncetion.js';

class UrlsRepositories
{
	
	create( {urlReference, url, id} ){
		const query = {
			text : `
				INSERT INTO urls ("shortUrl", url, "creatorId")
				VALUES ($1, $2, $3)
			`,
			values : [urlReference, url, id]
		};

		return db.query( query );
	}

	listByRef( {urlReference} ){
		const query = {
			text : `
				SELECT urls.id, urls."shortUrl" FROM urls 
				WHERE urls."shortUrl" = $1
			`,
			values : [urlReference]
		};

		return db.query( query );
	}
}

export default new UrlsRepositories;