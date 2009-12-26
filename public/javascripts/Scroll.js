if (!SC_Pro){
	var SC_Pro = new Array();
}
function scrollLogo(id,arg){
	var obj = document.getElementById(id);
	if (obj.offsetHeight<obj.parentNode.offsetHeight){
		return;
	}
	if (!obj.getAttribute('init')){
		obj.innerHTML += obj.innerHTML;
		obj.setAttribute('init',1)
		obj.onmouseover = function(){
			this.setAttribute('init',0);
			clearTimeout(SC_Pro[arg]);
		}
		obj.onmouseout = function(){
			this.setAttribute('init',1);
			var id = this.id;
			SC_Pro[arg] = setTimeout(function(){scrollLogo(id,arg);},100);
		}
	}
	var top = obj.style.top.replace('px','') * 1;
	top = (top > obj.offsetHeight * -0.5)?(top - obj.getAttribute('init') * 1):(obj.getAttribute('init') * -1);
	obj.style.top = top + 'px';
	if (obj.getAttribute('init')=='1'){
		SC_Pro[arg] = setTimeout(function(){scrollLogo(id,arg);},50);
	}
}
