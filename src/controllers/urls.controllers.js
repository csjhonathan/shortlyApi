import { nanoid } from 'nanoid';
import urlsRepositories from '../repositories/urls.repositories.js';

class UrlsControllers 
{
	async creat( req, res ){
		const {id} = res.locals.user;
		const {url} = req.body;


		try {
			const urlReference = nanoid( 5 );

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
		const {id : urlId} = req.params;
		
		try {

			const {rows : [url]} = await urlsRepositories.listById( {urlId} );

			if( !url ) return res.status( 404 ).send( {message : 'Esta url não existe!'} );

			delete url.creatorId;
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

			return res.redirect( 200,shortedUrl.url );
		} catch ( error ) {
			return res.status( 500 ).send( {message : error.message} );
		}
	}

	async delete( req, res ){
		const {id: urlId} = req.params;
		const {id : userId} = res.locals.user;

		try {
			const {rows : [url]} = await urlsRepositories.listById( {urlId} );

			if( !url ) return res.status( 404 ).send( {message : 'Esta url não existe!'} );
			if( url.creatorId !== userId ) return res.status( 401 ).send( {message : 'Esta url pertence a outro usuário!'} );
			await urlsRepositories.delete( {urlId} );
			res.sendStatus( 204 );
		} catch ( error ) {
			return res.status( 500 ).send( {message : error.message} );
		}
	}
}


export default new UrlsControllers;