const express=requere("express")
const pool=requre("../pool.js")
var Router=express()
Router.get("/all",(res,req)=>{
     pool.query()
})





module.exports=Router;