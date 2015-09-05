// Modelo genérico
(function () {
	function AjaxModel(url) {
		riot.observable(this);
		this.url = url;
	};

	var model = AjaxModel.prototype;

	model.load = function(url, data) {
		this.url = url || this.url;
		var me = this;
		return $.getJSON(this.url, data)
			.then(function (data, status) {
				me.ajaxStatus = status;
				me.data = data; // nueva variable para no amontonar los objetos
				$.extend(me, data);
				me.trigger('updated', status);
			});
	};

	window.AjaxModel = AjaxModel;
})();
