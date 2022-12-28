const express = require('express');
const {getUsersList, getBanksList, getCurrenciesList, getCategoriesList} = require('./../controller/dropdownlists');

const router = express.Router();


router.get('/ddl/users', getUsersList);
router.get('/ddl/banks', getBanksList);
router.get('/ddl/currencies', getCurrenciesList);
router.get('/ddl/categories', getCategoriesList);

module.exports = router;