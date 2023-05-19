import rankingRepositories from '../repositories/ranking.repositories.js';

class RankingControllers
{
	async list( req, res ){
		try {
			const {rows : rank} = await rankingRepositories.list();
			console.log( rank );
			res.status( 200 ).send( rank );
		} catch ( error ) {
			res.status( 500 ).send( {message : error.message} );
		}
	}
}

export default new RankingControllers;