

const express = require('express');
const cors = require('cors');
const {server} = require('./src/config/config');
const oracle = require('./src/database/oracle');
const cookie = require('cookie-parser');

/** Routes */
const routesNotFound = require('./src/route/notFound');
const routesUser = require('./src/route/user');
const routesCategories = require('./src/route/category');

const app = express();


app.use(cors());
app.use(cookie());
app.use(express.json());


app.use(routesCategories);
app.use(routesUser);

/** If route is not found or not allowed */
app.use(routesNotFound);


/** Main thread */
oracle.start().then(()=>{
    console.log('Oracle DB connected and ready');
    app.listen(server.port, ()=>{
        console.log(`Server listening on port : ${server.port}`);
    })
}).catch((error)=>{
    console.log('index x464:'+error);
    process.exit(1);
});
