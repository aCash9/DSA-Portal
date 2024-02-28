let arrow = document.querySelectorAll(".arrow");
for (var i = 0; i < arrow.length; i++) {
	arrow[i].addEventListener("click", (e) => {
		let arrowParent = e.target.parentElement.parentElement;
		arrowParent.classList.toggle("showMenu");
	});
}
let sidebar = document.querySelector(".sidebar");
let sidebarBtn = document.querySelector(".bx-menu");
console.log(sidebarBtn);

sidebarBtn.addEventListener("click", () => {
	sidebar.classList.toggle("close");
});

let codeBtn = document.querySelector(".bx-code-block");
console.log(codeBtn);

codeBtn.addEventListener("click", () => {
	window.location.href = 'welcome.jsp';
});

function logout() {
	var form = document.createElement('form');
	form.method = 'post';
	form.action = 'logoutServlet';
	document.body.appendChild(form);
	form.submit();
}

