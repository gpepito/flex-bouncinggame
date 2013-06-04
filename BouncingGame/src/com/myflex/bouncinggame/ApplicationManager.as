package com.myflex.bouncinggame
{
    import spark.components.Application;
    
    public class ApplicationManager extends Application
    {
        private var _userType:int;
        private var _userId:int;
        public function ApplicationManager()
        {
            super();
        }

        public function get userType():int
        {
            return _userType;
        }

        public function set userType(value:int):void
        {
            _userType = value;
        }

        public function get userId():int
        {
            return _userId;
        }

        public function set userId(value:int):void
        {
            _userId = value;
        }


    }
}