const oracledb = require('oracledb');
const path = require('path');


const {oracleConf} = require('./../config/config');


const clientPath = path.join('C:','oracle','Oracle21c','bin');

oracledb.initOracleClient({libDir:clientPath});

module.exports.start = async() => {
    console.log(oracleConf);
    console.log(`Oracle client binaries at: ${clientPath}`);
    await oracledb.createPool(oracleConf);
};


module.exports.close = async()=>{
    await oracledb.getPool().close(0);
};

module.exports.pool = async(statement, binds=[], opts={}) => {
    console.log('----- ORACLE ----');
    let conn;
    let result=[];

    opts.outFormat = oracledb.OBJECT;
    //opts.outFormat = oracledb.DB_TYPE_OBJECT;

    try{
        conn = await oracledb.getConnection();
        result = await conn.execute(statement, binds, opts);
        
        console.log('RESULT:');
        console.log(result);
        return result;

    } catch(error){
        console.error('Oracle opening DB: '+error);
        throw error;
    } finally{
        if(conn){
            try{
                await conn.close();
            } catch(error){
                console.log('Oracle closing DB: '+error);
            }
        }
    }



};

