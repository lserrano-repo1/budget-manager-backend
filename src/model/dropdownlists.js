const {pool} = require('./../database/oracle');


const ddlSqlUsers = `SELECT USR_ID "id", (USR_SALUTATION || ' ' || USR_FIRST_NAME || ' ' || USR_LAST_NAME) "value" FROM BUDGETMAN.USERDATA`;
const ddlSqlBanks = `SELECT BNK_ID "id", BNK_NAME "value" FROM BUDGETMAN.BANK`;
const ddlSqlCurrency = `SELECT CUR_ID "id", CUR_NAME "value" FROM BUDGETMAN.CURRENCY`;
const ddlSqlCategories = `SELECT CAT_ID "id", CAT_NAME "value" FROM BUDGETMAN.CATEGORIES`;
const ddlSqlTranType = `SELECT TYP_ID "id", TYP_NAME "value"  FROM TRANTYPE t `;

/**
 * User's list
 * @returns 
 */
module.exports.ddlUsers = () =>{
    return pool(ddlSqlUsers);
};

/**
 * Bank's list
 * @returns 
 */
module.exports.ddlBanks =()=>{
    return pool(ddlSqlBanks);
};

/**
 * Currencies list
 * @returns 
 */
module.exports.ddlCurrency =()=>{
    return pool(ddlSqlCurrency);
};

/**
 * Categories list
 * @returns 
 */
module.exports.ddlCategories =()=>{
    return pool(ddlSqlCategories);
};



module .exports.ddlTranType = ()=>{
    return pool(ddlSqlTranType);
}