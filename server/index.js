const express = require('express');

const mongoose = require('mongoose');

const authRouter = require("./routes/auth")

const cors = require('cors')

const PORT = process.env.PORT | 3001;

const app = express();

app.use(cors());

app.use(express.json())

const DB = "mongodb+srv://albqkx:1921141425@eduhome.eskt5gx.mongodb.net/?retryWrites=true&w=majority"


mongoose.connect(DB).then(()=>{
    console.log("Connection SUccess")
}).catch((err)=>{
    console.log(err)
})
app.use(authRouter)

app.listen(PORT,"0.0.0.0",() => {
    console.log("Server Started! at 3001")
});