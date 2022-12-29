const express = require('express');
const {tranFiltered,create,getAll} = require('./../controller/transaction');

const router = express.Router();

router.post('/transactions/filter',tranFiltered);
router.post('/transactions/new',create);

router.get('/transactions/getAll',getAll);

module.exports = router;