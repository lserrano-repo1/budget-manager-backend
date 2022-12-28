const DDLists = require('./../model/dropdownlists');


/**
 * This method will retrieve user's list
 * @param {*} res 
 * @param {*} req 
 * @param {*} next 
 */
module.exports.getUsersList = async(req,res,next)=>{
  try {
    const {rows} = await DDLists.ddlUsers();
    res.status(200).json({rows});
  } catch (error) {
    res.status(400).json({error:error});
  }
};


/**
 * This method will retrieve bank's list
 * @param {*} res 
 * @param {*} req 
 * @param {*} next 
 */
module.exports.getBanksList = async(req,res,next)=>{
    try {
      const {rows} = await DDLists.ddlBanks();
      res.status(200).json({rows});
    } catch (error) {
      res.status(400).json({error:error});
    }
  };

/**
 * This method will retrieve currencies list
 * @param {*} res 
 * @param {*} req 
 * @param {*} next 
 */
module.exports.getCurrenciesList = async(req,res,next)=>{
    try {
      const {rows} = await DDLists.ddlCurrency();
      res.status(200).json({rows});
    } catch (error) {
      res.status(400).json({error:error});
    }
  };

/**
 * This method will retrieve categories list
 * @param {*} res 
 * @param {*} req 
 * @param {*} next 
 */
module.exports.getCategoriesList = async(req,res,next)=>{
    try {
      const {rows} = await DDLists.ddlCategories();
      res.status(200).json({rows});
    } catch (error) {
      res.status(400).json({error:error});
    }
  };