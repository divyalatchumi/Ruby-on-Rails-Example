angular.module("loginApp",[]).component("welcomeNote",{
	//template: "Hello There"
	template: "<h1>{{$ctrl.welcome.titleName}}</h1>" + "<h2>{{$ctrl.welcome.note}}</h2>" + "<h3>{{$ctrl.welcome.loginNote}}</h3>",
	controller: function(){
		this.welcome = {
			note: "Hello. Welcome to SampleApp.",
			titleName: "SampleApp",
			loginNote: "This is the login page. If you are not registered, register first!",
			registerNote: "This is the registration page. Please register to login!"
		};
	}
});