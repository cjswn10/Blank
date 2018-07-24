var colorName = ["maroon","red","orange","yellow","olive",
				 "purple","fuchsia","white","lime","green",
				 "navy","aqua","teal","black","silver","gray"];
	for(var i=0;i<16;i++) {
		document.write("<input type='button' id='"+ colorName[i] +"' onclick='cg_color(this.id)'>");
	}
	
	for(var i=0;i<16;i++) {
		var inputColor = document.getElementById(colorName[i]);
		inputColor.style.background = colorName[i];
	}