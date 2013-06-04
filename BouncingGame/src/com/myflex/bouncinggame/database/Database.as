package com.myflex.bouncinggame.database
{
    import flash.data.SQLConnection;
    import flash.data.SQLResult;
    import flash.data.SQLStatement;
    import flash.filesystem.File;

    public class Database
    {
        private var _conn:SQLConnection=new SQLConnection();
        private static const DBFILE:File=File.applicationDirectory.resolvePath("bouncinggame.db");
        private var _sqlStatement:SQLStatement=new SQLStatement();
        private var _mode:String=null;
        public function Database()
        {
        }
        public function createConn():void{
            _sqlStatement.sqlConnection=_conn;
        }
        public function openMode(mode:String):void{
            _mode=mode;
            _conn.open(DBFILE,_mode);
            trace("\nopenMode::::"+mode);
        }
        public function setStatement(statement:String):void{
            _sqlStatement.text=statement;
            trace("\nsetStatements::::"+statement);
        }
        public function setParams(paramField:String,paramValue:String):void{
            _sqlStatement.parameters[":"+paramField]=paramValue;
            trace("\nsetParams::::"+"paramField:"+paramField+"-----paramValue:"+paramValue);
        }
        public function execute():void{
            _sqlStatement.execute();
            trace("\nexecute:::::");
        }
        public function results():SQLResult{            
            trace("\nresults:::::");
            return _sqlStatement.getResult();
        }
    }
}