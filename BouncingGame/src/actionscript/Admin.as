
import com.myflex.bouncinggame.database.Controller;

import flash.data.SQLMode;
import flash.data.SQLResult;
import flash.utils.Dictionary;

import mx.collections.ArrayCollection;
import mx.controls.advancedDataGridClasses.AdvancedDataGridColumn;
import mx.utils.ArrayUtil;

[Bindable]
private var dataContent:ArrayCollection=new ArrayCollection();
[Bindable]
private  var arrayBook:ArrayCollection=new ArrayCollection([{Region:"Southwest", Territory:"Arizona", 
    Territory_Rep:"Barbara Jennings", Actual:38865, Estimate:40000}]);
private function populateData():void{
    var controller:Controller=new Controller();
    var data:Dictionary=new Dictionary();
    
    data["sqlmode"]=SQLMode.READ;
    data["sqltype"]="GET_ALL_ACCOUNT";
    controller.setData(data);
    
    var result:SQLResult=controller.getResult();
    var row:Object;    
/*   
    arrayBook=new ArrayCollection(ArrayUtil.toArray(xmlBookList));
    
    trace("test");   */
    
    for(var i:int=0;i<result.data.length;i++){
        row=result.data[i];
        dataContent.addItem(row);
    }
}

private function setDataContentStyle(data:Object, column:AdvancedDataGridColumn):Object{
    if(data["user_type_id"]<3){
        return {color:0x4cb848,textAlign:"center",fontWeight:"bold"}
    }
    return {color:0x7e6095,textAlign:"center",fontWeight:"bold"};
}