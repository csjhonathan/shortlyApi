import db from '../database/database-conncetion.js';

class RankingRepositories
{
	create( {id} ){
		const query = {
			text: `
        INSERT INTO access ("urlId")
        VALUES ($1)
      `,
			values : [id]
		};

		return db.query( query );
	}
}

export default new RankingRepositories;