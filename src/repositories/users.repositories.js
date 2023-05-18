import db from '../database/database-conncetion.js';

class UsersRepositories
{
	list(){
		return db.query( `
      SELECT * FROM users;
    ` );
	}
}

export default new UsersRepositories;