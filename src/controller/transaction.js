const Transaction = require('./../model/transaction');

/**
 * This method will handle transaction creation
 * @param {*} param0 
 * @returns 
 */
module.exports.create  = async(req,res,next)=>{
    console.log("--- Transanction Controller: Create ---");
    const inputParams ={
        curId: req.body.curId,
        accId: req.body.accId,
        catId: req.body.catId,
        typId: req.body.typId,
        trnAmount: req.body.trnAmount,
        trnDescription: req.body.trnDescription

    };

    console.info("Controller inputParams:");
    console.info(inputParams);

    try {
        const {outBinds} = await Transaction.create(inputParams);
        const {trnId} = {outBinds};

        console.log("1.1 Create transaction output");
        console.log(outBinds);
        console.log("1.2 trnId:");
        console.log(outBinds.trnId[0]);

        res.status(200).json({
            message: "New transaction created",
            bankId: outBinds.trnId[0]
        });
    } catch (error) {
        console.error(error);
        return res.status(400).json({
            error:error
        });
    };
};



/**
 * This controller method will retrieve all transactions with no filter
 * @param {*} req 
 * @param {*} res 
 * @param {*} next 
 */
module.exports.getAll = async(req,res,next) => {
    try {
        const {rows} =await Transaction.getAll();
        res.status(200).json({data:rows});
    } catch (error) {
        res.status(400).json({error:error});
    }
};


/**
 * This method will retrieve transactions as per 
 * the filters set up by the user 
 * @param {*} req 
 * @param {*} res 
 * @param {*} next 
 */
module.exports.tranFiltered = async(req,res,next)=>{
    console.log("--- Transaction Controller: filter ---");
console.info("REQ.BODY");
console.info(req.body);
    const inputParams ={
        trnCreationDate: req.body.trnCreationDate,
        catId: req.body.catId,
        accId: req.body.accId
    };

    console.info("inputParams:");
    console.info(inputParams);

    try {
        const {rows} = await Transaction.filters(inputParams);
        res.status(200).json({data:rows});
    } catch (error) {
        res.status(400).json({error:error});
    }
}

