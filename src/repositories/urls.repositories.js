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
				SELECT * FROM urls 
				WHERE urls."shortUrl" = $1
			`,
			values : [urlReference]
		};

		return db.query( query );
	}

	listById( {urlId} ){
		const query = {
			text : `
				SELECT urls.id, urls."shortUrl", urls.url, urls."creatorId" FROM urls 
				WHERE urls.id = $1
			`,
			values : [urlId]
		};

		return db.query( query );
	}

	update( {urlReference} ){
		const query = {
			text : `
				UPDATE urls 
				SET access = access + 1 
				WHERE urls."shortUrl" = $1
			`,
			values : [urlReference]
		};

		return db.query( query );
	}

	delete( {urlId} ){
		const query = {
			text : `
			DELETE FROM urls
			WHERE id = $1
			`,
			values : [urlId]
		};

		return db.query( query );
	}
}

export default new UrlsRepositories;