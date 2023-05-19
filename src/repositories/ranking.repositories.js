import db from '../database/database-conncetion.js';

class RankingRepositories
{
	list( ){
		const query = `
			SELECT  users.id, users.name,COUNT(urls."creatorId") AS "linksCount", COALESCE(SUM(urls.access),0) AS "visitCount"
			FROM users
			LEFT JOIN urls ON users.id = urls."creatorId"
			GROUP BY ( users.id )
			ORDER BY "visitCount" DESC
			LIMIT 10;
		`;

		return db.query( query );
	}
}

export default new RankingRepositories;