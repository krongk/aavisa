/*     MyValidator, version 1.0
 *    (c) 2006 rocky.shen <6662714258@163.com>
 *
/*
 * MyValidator Class
 *--------------------------------------------------------------------------*/
var MyValidator = Class.create();
MyValidator.prototype = {
	initialize:function () {
		this.validations = new Array();
		this.popError =null;
		this.errorIds = null;
		this.errors = null;
	}, 
	addValidation:function (validation) {
		if (validation instanceof Validation) {
			this.validations[validation.id] = validation;
		}
	}, 
	getTipId:function (id) {
		return id + "Tip";
	}, 
	getMessageBody:function (id, message) {
		return "<span class='validate_message' id='" + id + "'>" + (message == null ? "" : message) + "</span>";
	}, 
	getErrorBody:function (id, error) {
		return "<span class='validate_error' id='" + id + "'>" + error + "</span>";
	}, 
	handleError:function (event) {
		var id = Event.element(event).id;
		var validation = this.validations[id];
		var element = $(this.getTipId(id));
		if (validation.validate()) {
			element.innerHTML = this.getMessageBody(id, validation.message);
		} else {
			element.innerHTML = this.getErrorBody(id, validation.error);
		}
	}, 
	handleMessage:function (event) {
		var id = Event.element(event).id;
		var validation = this.validations[id];
		if (validation.message != null) {
			var element = $(this.getTipId(id));
			element.innerHTML = this.getMessageBody(this.getTipId(id), validation.message);
		}
	}, 
	handleCheckError:function (event) {
		var id = Event.element(event).vid;
		var validation = this.validations[id];
		var element = $(this.getTipId(id));
		if (validation.validate()) {
			element.innerHTML = this.getMessageBody(id, validation.message);
		} else {
			element.innerHTML = this.getErrorBody(id, validation.error);
		}
	}, 
	handleCheckMessage:function (event) {
		var id = Event.element(event).vid;
		var validation = this.validations[id];
		if (validation.message != null) {
			var element = $(this.getTipId(id));
			element.innerHTML = this.getMessageBody(this.getTipId(id), validation.message);
		}
	}, 
	setUp:function (mode) {
		mode=mode||1;
		for (id in this.validations) {
			var validation = this.validations[id];
			var element = $(id);
			if (validation instanceof CheckboxRangeValidation||validation instanceof RadioRangeValidation) {
				if(mode==1){
					var groups = document.getElementsByName(validation.name);
					var count = groups.length;
					for(var i=0; i<count; i++){
						var ele=groups[i];
						ele.setAttribute("vid",validation.id);					
						ele.onblur = this.handleCheckError.bindAsEventListener(this);
						ele.onfocus = this.handleCheckMessage.bindAsEventListener(this);	
					}
				}
				new Insertion.After(id, this.getMessageBody(this.getTipId(id), validation.message));
			}else if (validation instanceof Validation){	
				if(mode==1){
					element.onblur = this.handleError.bindAsEventListener(this);
					element.onfocus = this.handleMessage.bindAsEventListener(this);	
				}					
				new Insertion.After(id, this.getMessageBody(this.getTipId(id), validation.message));
			}
		}
	},
	isPassed:function (mode) {
		this.popError ="\n";
		this.errorIds = new Array();
		this.errors = new Array();
		var isPassed=true;
		var validation=null;
		for (id in this.validations) {
			validation = this.validations[id];
			if (validation instanceof Validation) {
				if(!validation.validate()){
					this.errorIds[this.errorIds.length] = validation.id;
					this.errors[this.errors.length] =(this.errors.length+1) + ". " + validation.error;
					isPassed = false;
				}
			}
		}
		
		if(this.errors.length > 1){
			mode = mode || 1;
			var errCount = this.errorIds.length;
			switch(mode){
			case 1 :
				var element=null;
				for (id in this.validations) {
						var validation = this.validations[id];
						element = $(this.getTipId(id));
						if (validation instanceof Validation){	
							$(id).className ="form_validate_error";//by_song
							element.innerHTML = this.getMessageBody(id, validation.message);
						}
				}
				for(var i=0;i<errCount;i++){
					element = $(this.getTipId(this.errorIds[i]));
					element.innerHTML = this.getErrorBody(this.errorIds[i], this.validations[this.errorIds[i]].error);
				}
				break;
			case 2 :
				this.popError =this.popError + this.errors.join("\n");																		
				break;
			default :
				this.popError =this.popError + this.errors.join("\n");								
			}
		}
		return isPassed;
	}
};

/*
*	the base 'abstract' validation class
*---------------------------------------------------------------------------*/
var Validation = Class.create();
Validation.prototype = {
	initialize:function () {
		this.id = null;
		this.message = null;
		this.error = null;
		this.require = false;
		this.params = new Array();
	}, 
	validate:function () {
		return false;
	}
};

/*
 *  CheckboxRangeValidation class
 *---------------------------------------------------------------------------*/
var CheckboxRangeValidation = Class.create();
CheckboxRangeValidation.prototype = Object.extend(new Validation(), 
{
	initialize:function(id,require,name, message, error,min,max){
		this.id = id;
		this.message = message;
		this.error = error;
		this.min=min;
		this.max=max;
		this.name=name;
		if (require=="true") {
			this.require = true;
		}
	}, 
	validate:function () {	
		return checkboxRange(this.require,this.name,this.min, this.max);
	}
}
);

/*
 *  RadioRangeValidation class
 *---------------------------------------------------------------------------*/
var RadioRangeValidation = Class.create();
RadioRangeValidation.prototype = Object.extend(new Validation(), 
{
	initialize:function(id,require,name, message, error,min,max){
		this.id = id;
		this.message = message;
		this.error = error;
		this.min=min;
		this.max=max;
		this.name=name;
		if (require=="true") {this.require = true;}
	}, 
	validate:function () {	
		return radioRange(this.require,this.name, this.min, this.max);
	}
}
);

/*
 *  SelectRangeValidation class
 *---------------------------------------------------------------------------*/
var SelectRangeValidation = Class.create();
SelectRangeValidation.prototype = Object.extend(new Validation(), 
{
	initialize:function(id,require,name, message, error,min,max){
		this.id = id;
		this.message = message;
		this.error = error;
		this.min=min;
		this.max=max;
		this.name=name;
		if (require=="true"){this.require = true;}
	}, 
	validate:function () {			
		return selectRange(this.require,this.name,this.id, this.min, this.max);
	}
}
);


/*
 *  InputRangeCustomValidation class
 *---------------------------------------------------------------------------*/
var InputRangeCustomValidation = Class.create();
InputRangeCustomValidation.prototype = Object.extend(new Validation(), 
{
	initialize:function (id,require, message, error,lenType,min,max,reg) {
		this.id = id;
		this.message = message;
		this.error = error;
		this.lenType=lenType;
		this.min=min;
		this.max=max;
		this.reg=reg;
		if (require=="true") {
			this.require = true;
		}
	}, 
	validate:function () {
		if (this.require==false) {
			if(isEmpty($F(this.id))){return true;}
		}
		var flag=true;
		switch (this.lenType){
			case "lenB":flag=isInRange(lenB($F(this.id)),this.min, this.max);break;
			case "len":flag=isInRange(len($F(this.id)),this.min, this.max);break;
			case "value":flag=isInRange($F(this.id),this.min, this.max);break;
			default:flag=true;break;		
		}
		return flag&&isTrue($F(this.id),this.reg);
	}
}
);
/*==========================================================================*/
/**
* MatchedValidation class
*---------------------------------------------------------------------------*/
var MatchedValidation = Class.create();
MatchedValidation.prototype = Object.extend(new Validation(), 
{
	initialize:function (id,require,matchedId, message, error) {
		this.id = id;
		this.message = message;
		this.error = error;
		this.params[0] = matchedId;
		if (require=="true") {
			this.require = true;
		}
	}, 
	validate:function () {
		if (this.require==true) {
			if(isEmpty($F(this.id))){return false;}
			return isMatch($F(this.id), $F(this.params[0]));
		}else{
			if(!isEmpty($F(this.id))){
				return isMatch($F(this.id), $F(this.params[0]));
			}
			return true;
		}
	}
}
);

/*==========================================================================*/
/**
* the RequiredValidation class
*/
var OnlyRequiredValidation = Class.create();
OnlyRequiredValidation.prototype = Object.extend(new Validation(), 
{
	initialize:function (id,require, message, error) {		
		this.id = id;
		this.message = message;
		this.error = error;
		if (require=="true") {
			this.require = true;
		}
	}, 
	validate:function () {
		if (this.require==true) {
			return !isEmpty($F(this.id));
		}
		return true;
	}
}
);
/*
 * EmailValidation class
 */
var EmailValidation = Class.create();
EmailValidation.prototype = Object.extend(new Validation(), 
{
	initialize:function (id,require, message, error) {
		this.id = id;
		this.message = message;
		this.error = error;
		if (require=="true") {
			this.require = true;
		}
	}, 
	validate:function () {
		if (this.require==true) {
			return isEmail($F(this.id));
		}else{
			if(!isEmpty($F(this.id))){
				return isEmail($F(this.id));
			}
			return true;
		}
	}
}
);


/*
 * EnglishValidation class
 */
var EnglishValidation = Class.create();
EnglishValidation.prototype = Object.extend(new Validation(), 
{
	initialize:function (id,require, message, error) {
		this.id = id;
		this.message = message;
		this.error = error;
		if (require=="true") {
			this.require = true;
		}
	}, 
	validate:function () {
		if (this.require==true) {
			if(isEmpty($F(this.id))){return false;}
			return isLetter($F(this.id));
		}else{
			if(!isEmpty($F(this.id))){
				return isLetter($F(this.id));
			}
			return true;
		}
	}
}
);

/*
 * ChineseValidation class
 */
var ChineseValidation = Class.create();
ChineseValidation.prototype = Object.extend(new Validation(), 
{
	initialize:function (id,require, message, error) {
		this.id = id;
		this.message = message;
		this.error = error;
		if (require=="true") {
			this.require = true;
		}
	}, 
	validate:function () {
		if (this.require==true) {			
			return isChinese($F(this.id));
		}else{
			if(!isEmpty($F(this.id))){
				return isChinese($F(this.id));
			}
			return true;
		}
	}
}
);
/*
 * CustomValidation class
 */
var CustomValidation = Class.create();
CustomValidation.prototype = Object.extend(new Validation(), 
{
	initialize:function (id,require, message, error,reg) {
		this.id = id;
		this.message = message;
		this.error = error;
		this.reg=reg;
		if (require=="true") {
			this.require = true;
		}
	}, 
	validate:function () {
		if (this.require==false) {
			if(isEmpty($F(this.id))){return true;}
		}		
		return isTrue($F(this.id),this.reg);
	}
}
);

/*------------------- below the common used function------start-------------------------*/

// returns true if the string is empty
function isEmpty(str) {
	return (str == null) || (str.length == 0);
}
// returns true if the string is a valid email
function isEmail(str) {
	if (isEmpty(str)) {
		return false;
	}
	var re = /^[^\s()<>@,;:\/]+@\w[\w\.-]+\.[a-z]{2,}$/i;
	return re.test(str);
}
// returns true if the string only contains characters A-Z or a-z
function isLetter(str) {
	var re = /[^a-zA-Z]/g;
	if (re.test(str)) {
		return false;
	}
	return true;
}
function isChinese(str){
	return  /^[\u0391-\uFFE5]+$/.test(str);
}
// returns true if the string only contains characters 0-9
function isNumeric(str) {
	var re = /[\D]/g;
	if (re.test(str)) {
		return false;
	}
	return true;
}
// returns true if the string only contains characters A-Z, a-z or 0-9
function isLetterAndNumeric(str) {
	var re = /[^a-zA-Z0-9-]/g;
	if (re.test(str)) {
		return false;
	}
	return true;
}
// returns true if the string is a US phone number formatted as...// (000)000-0000, (000) 000-0000, 000-000-0000, 000.000.0000, 000 000 0000, 0000000000
function isPhoneNumber(str) {
	var re = /^\(?[2-9]\d{2}[\)\.-]?\s?\d{3}[\s\.-]?\d{4}$/;
	return re.test(str);
}
// returns true if the string is a valid date formatted as...// mm dd yyyy, mm/dd/yyyy, mm.dd.yyyy, mm-dd-yyyy
function isDate(str) {
	var re = /^(\d{4})[\s\.\/-](\d{1,2})[\s\.\/-](\d{1,2})$/;
	if (!re.test(str)) {
		return false;
	}
	var result = str.match(re);
	var y = parseInt(result[1]);
	var m = parseInt(result[2]);
	var d = parseInt(result[3]);
	if (m < 1 || m > 12 || y < 1900 || y > 2100) {
		return false;
	}
	if (m == 2) {
		var days = ((y % 4) == 0) ? 29 : 28;
	} else {
		if (m == 4 || m == 6 || m == 9 || m == 11) {
			var days = 30;
		} else {
			var days = 31;
		}
	}
	return (d >= 1 && d <= days);
}
// returns true if "str1" is the same as the "str2"
function isMatch(str1, str2) {
	return str1 == str2;
}
// returns true if the string contains only whitespace  ps: cannot check a password type input for whitespace?
function isWhitespace(str) { 
	var re = /[\S]/g;
	if (re.test(str)) {
		return false;
	}
	return true;
}
// removes any whitespace with replacement from the string and returns the result
function stripWhitespace(str, replacement) {// NOT USED IN FORM VALIDATION
	if (replacement == null) {
		replacement = "";
	}
	var result = str;
	var re = /\s/g;
	if (str.search(re) != -1) {
		result = str.replace(re, replacement);
	}
	return result;
}
function isTrue(value, reg){
		return reg.test(value);
}
function lenB(str){
		return str.replace(/[^\x00-\xff]/g,"**").length;
}
function len(str){
		return str.length;
}
function isInRange(len,min, max){
		min = min || 0;
		max = max || Number.MAX_VALUE;
		return min <= len && len <= max;
}
function compare(op1,operator,op2){
		switch (operator) {
			case "NotEqual":
				return (op1 == op2);
			case "Equal":
				return (op1 != op2);
			case "GreaterThan":
				return (op1 > op2);
			case "GreaterThanEqual":
				return (op1 >= op2);
			case "LessThan":
				return (op1 < op2);
			case "LessThanEqual":
				return (op1 <= op2);
			default:
				return (op1 == op2);            
		}
}
function selectRange(require,name,id, min, max){
	var groups = document.getElementById(id);
	var hasChecked = 0;
	min = require==true?min || 1: 0;
	max = max || groups.options.length;
	for(var i=groups.options.length-1;i>=0;i--){
		var opt =groups[i];
		if(opt.selected&&opt.value!="") hasChecked++;
	}
	return min <= hasChecked && hasChecked <= max;
}
//the checkbox must checked in the right number if require=true ,else  must less than the groups's length
function radioRange(require,name, min, max){
	var groups = document.getElementsByName(name);
	var hasChecked = 0;
	min = require==true?min || 1: 0;
	max = max || groups.length;
	for(var i=groups.length-1;i>=0;i--){
		if(groups[i].checked) hasChecked++;
	}
	return min <= hasChecked && hasChecked <= max;
}
function checkboxRange(require,name, min, max){
	var groups = document.getElementsByName(name);
	var hasChecked = 0;
	min = require==true?min || 1: 0;
	max = max || groups.length;
	for(var i=groups.length-1;i>=0;i--){
		if(groups[i].checked) hasChecked++;
	}
	return min <= hasChecked && hasChecked <= max;
}
/*------------------- above the common used function------end-------------------------*/

/*--------------------------set the html object the prepare value-------start-------------------------*/

function setSelect(selectId,value,disabled){
	var selectH = document.getElementById(selectId);
	var len=selectH.options.length;
	for(var i=0; i<len; i++){
		var opt=selectH[i];
		if(opt.value==value){
			selectH.selectedIndex=i;			
			break;
		}			
		if(opt.childNodes[0].nodeValue==value){
			selectH.selectedIndex=i;
			break;
		}
	}
	selectH.disabled=disabled;
}

function setRadio(name,value,disabled){
	var elements = document.getElementsByName(name);
	for(var i=0; i<elements.length; i++){
		var ele=elements[i];	
		if(value==ele.value){
			ele.setAttribute("checked","true");
			break;
		}
	}
	for(var i=0; i<elements.length; i++){
		var ele=elements[i];
		ele.setAttribute("disabled",disabled);
	}
}

function setCheckbox(name,array,disabled){
	var elements = document.getElementsByName(name);	
	for(var i=0; i<elements.length; i++){
		var ele = elements[i];
		ele.setAttribute("disabled",disabled);
		if(isInArray(array,parseInt(ele.value))){
			ele.setAttribute("checked","checked");
		}
	}	
}

function isInArray(array,value){
	for(var i = 0; i< array.length; i++){
		if(value==array[i]){return true;}
	}
	return false;
}
/*--------------------------set the html object the prepare value---end-----------------------------*/


/*-------------------------- useful functions but some of them only validate in IE---start--------*/

function refuseWithReg(obj,myreg){
	var pos = getPos(obj);

	if(myreg.test(obj.value)){
	 	pos = pos - 1;
	}
	if(obj.value.match){
		obj.value = obj.value.replace(myreg,'');
	}
	setCursor(obj,pos);
}
function getPos(obj) {
        obj.focus();
        var workRange=document.selection.createRange();
        obj.select();
        var allRange=document.selection.createRange();
        workRange.setEndPoint("StartToStart",allRange);
        var len=workRange.text.length;
        workRange.collapse(false);
        workRange.select();

        return len;
}
function setCursor(obj,num){
        range=obj.createTextRange(); 
        range.collapse(true); 
        range.moveStart('character',num); 

        range.select();
}
function trimAllElements(formobj){
	var count = formobj.elements.length;
	for(var i=0;i<count;i++){
		var obj = formobj.elements[i];
		if(obj.tagName == "INPUT" || obj.tagName == "TEXTAREA"){
			obj.value = trim(obj.value);
		}
	}
}
function LTrim( value ) {	
	var re = /\s*((\S+\s*)*)/;
	return value.replace(re, "$1");	
}
function RTrim( value ) {	
	var re = /((\s*\S+)*)\s*/;
	return value.replace(re, "$1");	
}
// Removes leading and ending whitespaces
function trim( value ) {
	return LTrim(RTrim(value));
}
/*-------------------------- useful functions but some of them only validate in IE---start--------*/
var regObj={
	_require : /.+/,
	_email : /^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/,
	_phone : /^((\(\d{3}\))|(\d{3}\-))?(\(0\d{2,3}\)|0\d{2,3}-)?[1-9]\d{6,7}$/,
	_mobile : /^((\(\d{3}\))|(\d{3}\-))?13\d{9}$/,
	_url : /^http:\/\/[A-Za-z0-9]+\.[A-Za-z0-9]+[\/=\?%\-&_~`@[\]\':+!]*([^<>\"\"])*$/,
	_idCard : /^\d{15}(\d{2}[A-Za-z0-9])?$/,
	_currency : /^\d+(\.\d+)?$/,
	_number : /^\d+$/,
	_zip : /^[1-9]\d{5}$/,
	_qq : /^[1-9]\d{4,8}$/,
	_integer : /^[-\+]?\d+$/,
	_double : /^[-\+]?\d+(\.\d+)?$/,
	_english : /^[A-Za-z]+$/,
	_chinese :  /^[\u0391-\uFFE5]+$/,
	_unSafe : /^(([A-Z]*|[a-z]*|\d*|[-_\~!@#\$%\^&\*\.\(\)\[\]\{\}<>\?\\\/\'\"]*)|.{0,5})$|\s/,
	_date: /^(\d{4})([-./])(\d{2})\2(\d{2})$/
}
/*
*
*-----------------------------------*/
