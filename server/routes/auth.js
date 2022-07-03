 const express = require('express'); 


 const authRouter = express.Router();
 
 authRouter.post('/api/signup',(req,res)=>{
    const {name,mobile,email,password}=req.body;
    // get data from client
    // post the data in database
    // return data to user 
 });

 module.exports=authRouter;