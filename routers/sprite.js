const express=require("express")
const pool=require("../pool.js")
var Router=express.Router()
Router.get("/all",(req,res)=>{
     var obj=req.query;
     console.log(obj);
     if(obj.id_name=="全部"){
     pool.query(`select * from pet_list`,(err,result)=>{
          if(err) throw err;
          res.send(result);
          console.log(result);
     })
}else{
     pool.query(`select * from pet_list where list_id=(select pet_id from pet where id_name="${obj.id_name}")`,(err,result)=>{
          if(err) throw err;
          res.send(result);
     })
}
})





module.exports=Router;