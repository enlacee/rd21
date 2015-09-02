<!-- TAG-coleccion-lista -->
<coleccion-lista>
	<ul>
		<li each={colecciones} riot-tag="coleccion-item"></li>
	</ul>
	<script>
		var tag = this;
		env.add('tag-coleccion-lista', tag);

		env.colecciones.on('updated', function(status) {
			tag.colecciones = this.collections;
			tag.update();
		});

		// start
		env.colecciones.load();
	</script>
</coleccion-lista>





<!-- ---------------------------------------------------------------------- -->
<!-- TAG-coleccion-item -->
<coleccion-item>
	<span onclick={ goto } class="{ selected: this.href == env.cur_coleccion.href }">
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
	<style>
		.selected {
			font-weight:bold;
		}
	</style>
</coleccion-item>
