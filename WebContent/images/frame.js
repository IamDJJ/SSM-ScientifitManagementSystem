<!--


$(document).ready(function() {
	
	var getObj = $('li.menulist');
	
	$('li.menulist')[0].className="menulistnow";

	getObj.each(function(id) {
		var obj = this.id;
		$("li#"+obj).mouseover(function() {
			$('li.menulistover').each(function(id) {
				this.className="menulist";
			});
			if(this.className!="menulistnow"){this.className="menulistover";};
		});
		$("li#"+obj).mouseout(function() {
			$('li.menulistover').each(function(id) {
				this.className="menulist";
			});
		});

		$("li#"+obj).click(function() {
			$('li.menulistnow').each(function(id) {
				this.className="menulist";
			});
			this.className="menulistnow";
		});
	});
});




//管理退出
$(document).ready(function(){
	$("#pdv_logout").click(function () { 
		$.ajax({
			type: "POST",
			url: PDV_RP+"post.asp",
			data: "act=adminlogout",
			success: function(msg){
				if(msg=="OK"){
					top.location=PDV_RP+"admin.asp";
				}else{
					alert(msg);
				}
				
			}
		});
	 });
});




-->