import com.myflex.bouncinggame.UserType;
import com.myflex.bouncinggame.database.Controller;

import flash.data.SQLMode;
import flash.data.SQLResult;
import flash.errors.SQLError;
import flash.utils.Dictionary;

import mx.collections.ArrayCollection;

[Bindable]private var state:String="loginState";
protected function logIn():Boolean
{
    var user:UserType=new UserType();
    try{
        var controller:Controller=new Controller();
        var data:Dictionary=new Dictionary();
        
        data["username"]=login.username.toString();
        data["password"]=login.password.toString();
        data["sqltype"]="LOGIN";
        data["sqlmode"]=SQLMode.READ;
        controller.setData(data);
        
        var result:SQLResult=controller.getResult();
        if(result.data!=null){    
            var numResults:int = result.data.length;
            for (var i:int = 0; i < numResults; i++)
            {
                var row:Object = result.data[i];
                switch(row.user_type_id)
                {
                    case user.ADMIN:
                    {
                        state="adminState";
                        break;
                    }
                        
                    case user.SUPER_USER:
                    {
                        state="adminState";
                        break;
                    }
                    case user.USER:
                    {
                        state="gameState";
                        break;
                    }
                }
                break;
            }
            return true;
        }
        
    }catch(error:SQLError){
        trace("\nError Message:"+error.message);
        trace("\nError Details:"+error.details);
        return false;
    }
    return false;
}