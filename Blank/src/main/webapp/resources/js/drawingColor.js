var colorName = ["c1","c2","c3","c4","c5",
				 "c6","c7","c8","c9","c10",
				 "c11","c12","c13","c14","c15","c16"];
	for(var i=0;i<16;i++) {
		document.write("<input type='button' id='"+ colorName[i] +"' onclick='cg_color(this.id)'>");
	}
	
	for(var i=0;i<16;i++) {
		var inputColor = document.getElementById(colorName[i]);
		inputColor.style.background = colorName[i];
	}