const express = require('express');
const {accountCreate, deleteById
    , getAll, getByAccNumberExact
    , getByAccNumberLike, getById
    , updateAccount} = require("./../controller/account");

const router = express.Router();

router.post('/account/new', accountCreate);
router.post('/account/update', updateAccount);

router.get('/account/getAll',getAll);
router.get('/account/getById/:accId',getById);  //http://localhost:8500/account/getById/1
router.get('/account/getByNumberExact/:accId',getByAccNumberExact);  //http://localhost:8500/account/getById/1
router.get('/account/getByNumberLike/:accId',getByAccNumberLike);  //http://localhost:8500/account/getById/1

router.delete('/account/delete/:accId',deleteById);


module.exports = router;