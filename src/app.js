import express from 'express';
import cors from 'cors';
import routes from './routes/index.routes.js';
import chalk from 'chalk';
import dotenv from 'dotenv';
import runKeeper from './helpers/keepServerUp.js';

dotenv.config();

const app = express();

app 
	.use( cors() )
	.use( express.json() )
	.use( routes );

const PORT = process.env.PORT || 5000;
	
app.listen( process.env.PORT , () => {
	console.log( `Server is running on ${chalk.green( `http://localhost:${PORT}` )}` );
	runKeeper();
} );