// import from packages

const express = require('express');
const mongoose = require('mongoose').MongoClient,format = require('util').format;
// import from other file
const authRouter = require('./routes/auth.js');

// init
const PORT = 3000;
const app = express();
const DB = "mongodb+srv://sahil:SahilAorking007@cluster0.ty1ggsg.mongodb.net/?retryWrites=true&w=majority";

// middleware
   app.use(authRouter);

// connection 
mongoose.connect(DB,(err,db)=>{
   if(err){
    throw err;
   }else{
    console.log('Connect');
   }
});
app.listen(PORT, () => {
    console.log(`connect in port : ${PORT}`);
}); 