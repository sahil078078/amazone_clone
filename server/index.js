console.log('hello world');

const express = require('express');



const PORT = 3000;
const app = express();

// get , post , put , post , 
app.get(
    '/hello-world', (req, res) => {
        res.json({hi:'hello wolrd'}); 
    }
);

app.get('/',(req,res)=>{
    res.json({name:"Dr.Knight"});
});
app.listen(PORT, () => {
    console.log(`connect in port : ${PORT}`);
}); 