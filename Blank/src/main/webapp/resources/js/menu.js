/**
 * side-menu 
 */
function openNav() {
    document.getElementById("mySidenav").style.width = "250px";
    document.getElementById("wrapper").style.marginRight = "250px";
}

function closeNav() {
    document.getElementById("mySidenav").style.width = "0";
    document.getElementById("wrapper").style.marginRight= "0";
}



function openSearch() {
	document.getElementById("mainSearchId").style.display = "block";
	document.getElementById("mainSearchId_inner").style.display = "block";
}

function closeSearch() {
	document.getElementById("mainSearchId").style.display = "none";
	document.getElementById("mainSearchId_inner").style.display = "none";
}

/*
function openSearch() {
	$(".mainSearchId").css("display", "block");
	$(".mainSearchId_inner").css("display", "block");
	$("#wrapper").css("margin-top", "50px");
}

function closeSearch() {
	$(".mainSearchId").css("display", "none");
	$(".mainSearchId_inner").css("display", "none");
	$("#wrapper").css("margin-top", "0");
}

*/
