const jwt = require("jsonwebtoken")

const auth = async (req,res,next)=>{


    try{
        const token = req.header("x-auth-token");
        console.log( "The TOKEN " + token)
    
        if(!token){
            return res.status(401).json({msg:"No Auth Token, Access Denied!"});
        }

        const isVerified = await jwt.verify(token,"crucialKey");


   if(!isVerified) return res.status(401).json({msg:'Token verification failed! Authorization Denied.'})
            

   
   req.user = isVerified.id;
   req.token =  token;


 
    next();

    }
catch(e){

    res.status(500).json({error:e.message});

}



}

module.exports = auth;