import axios from 'axios';
import dotenv from 'dotenv';
dotenv.config();

const KEEPUP_URL = process.env.KEEPUP_URL;
const INTERVAL_DURATION = 20000;

function runKeeper() {
	if ( KEEPUP_URL ) {
		console.log( `Starting keep-alive requests to ${KEEPUP_URL} every ${INTERVAL_DURATION}ms.` );
		setInterval( keepAlive, INTERVAL_DURATION );
	} else {
		console.log( 'KEEPUP_URL is not defined. Keep-alive requests will not be sent.' );
	}
}

async function keepAlive() {
	try {
		await axios.get( KEEPUP_URL );
	} catch ( error ) {
		console.log( `Error sending keep-alive request to ${KEEPUP_URL}:`, error );
	}
}

export default runKeeper;