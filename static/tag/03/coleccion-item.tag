<coleccion-item>
	<span onclick={goto} class="{selected: this.href==env.cur_coleccion.href}">
	{name}
	</span>
	<ul>
		<li each={children} riot-tag="coleccion-item"></li>
	</ul>

	<script>
	var tag = this;

	goto(e) {
		env.cur_coleccion.load(this.href)
			.then(function(status) {
				env['tag-coleccion-lista'].update();
		});
	}
	</script>
	<style s>
		.selected {
			font-weight:bold;
		}
	</style>
</coleccion-item>
