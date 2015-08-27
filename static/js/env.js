/// observable global environment
(function(){
	function Env() {
		riot.observable(this);
		this.settings()
	};
	var E = Env.prototype;
	E.add = function (name, o) {
		this[name] = o;
		this.trigger('added', name, o);
		return this;
	};

	E.settings = function() {
		this.settings = {
			version: '0.2',
			baseUrl:  window.location.protocol + "//" + window.location.host
		}
		return this;
	}

	window.env = new Env();
})();
