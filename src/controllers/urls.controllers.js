import { nanoid } from 'nanoid';
import urlsRepositories from '../repositories/urls.repositories.js';
import rankingRepositories from '../repositories/ranking.repositories.js';
class UrlsControllers 
{
	async creat( req, res ){
		const {id} = res.locals.user;
		const {url} = req.body;


		try {
			const urlReference = nanoid();

			await urlsRepositories.create( {urlReference, url, id} );
			const {rows : [newUrl]} = await urlsRepositories.listByRef( {urlReference} );

			delete newUrl.access;
			delete newUrl.createdAt;
			delete newUrl.creatorId;
      
			res.status( 201 ).send( newUrl );

		} catch ( error ) {
			res.status( 500 ).send( {message : error.message} );
		}
	}
	async listById( req, res ){
		const {id} = req.params;
  
		try {
		
			const {rows : [url]} = await urlsRepositories.listById( {id} );
			if( !url ) res.status( 404 ).send( {message : 'Esta url não existe!'} );
			res.status( 200 ).send( url );

		} catch ( error ) {
			res.status( 500 ).send( {message : error.message} );
		}
	}

	async open( req, res ){
		const {shortUrl : urlReference} = req.params;

		try {
			const {rows : [shortedUrl]} = await urlsRepositories.listByRef( {urlReference} );
			if( !shortedUrl ) return res.status( 404 ).send( {message : 'Esta url não existe!'} );

			await urlsRepositories.update( {urlReference} );

			return res.redirect( shortedUrl.url );
		} catch ( error ) {
			return res.status( 500 ).send( {message : error.message} );
		}
	}
}


export default new UrlsControllers;