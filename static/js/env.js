/// observable global environment
(function(){
	function Env() {
		riot.observable(this);
	};
	var E = Env.prototype;
	E.add = function (name, o) {
		this[name] = o;
		this.trigger('added', name, o);
		return this;
	};

	window.env = new Env();
})();
