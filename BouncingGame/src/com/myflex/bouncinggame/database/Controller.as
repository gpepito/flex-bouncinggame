package com.myflex.bouncinggame.database
{
    import flash.data.SQLResult;
    import flash.utils.Dictionary;

    public class Controller
    {
        private const CREATE_TABLE_SQL:String="CREATE TABLE if not exists m_account ( accountId  INTEGER PRIMARY KEY AUTOINCREMENT, fname TEXT NOT NULL , lname TEXT NOT NULL, email TEXT NOT NULL, username TEXT NOT NULL, password TEXT NOT NULL)";
        private const ADD_SQL:String="INSERT INTO m_account( fname, lname, email, username, password) VALUES(:fname, :lname, :email, :username, :password)";
        private const LOGIN_SQL:String="SELECT * FROM m_account WHERE username=:username AND password=:password";
        private const GET_ALL_ACCOUNT_SQL:String="SELECT * FROM m_account";
        private var db:Database=new Database();
        
        public function Controller()
        {
            
        }
        public function setData(data:Dictionary):void{
            switch(data["sqltype"])
            {
                case SqlType.LOGIN:
                {
                    db.openMode(data["sqlmode"]);
                    db.createConn();
                    db.setStatement(LOGIN_SQL);
                    db.setParams("username",data["username"]);
                    db.setParams("password",data["password"]);
                    db.execute();
                    
                    trace(data["sqlmode"]+"\n"+
                          data["username"]+"\n"+
                          data["password"]+"\n");
                    break;
                }
                case SqlType.GET_ALL_ACCOUNT:
                {
                   db.openMode(data["sqlmode"]);
                   db.createConn();
                   db.setStatement(GET_ALL_ACCOUNT_SQL);
                   db.execute();
                    break;
                }
                default:
                {
                    break;
                }
            }            
        }
        public function getResult():SQLResult{
            return db.results();
        }
    }
}