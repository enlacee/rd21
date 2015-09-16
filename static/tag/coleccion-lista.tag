<coleccion-lista>
	<ul>
		<li each={ colecciones } riot-tag="coleccion-item"></li>
	</ul>
	<script>
		var me = this;
		me.colecciones = [];
		env.add('coleccion_lista', this);

		env.colecciones.on('updated', function(status) {
			if (status == 'success') {
				me.colecciones = env.colecciones.collections;
				me.update();
			}
		});
	</script>
</coleccion-lista>





<!-- Tag_coleccion_item -->
<coleccion-item>
	<style scoped>
		.selected {
			font-weight:bold;
		}
	</style>
	<span onclick="{ goto }" data-href="{ this.href }"
		class="{ selected: this.href == env.cur_coleccion.href }">
		{ name }
	</span>
	<ul>
		<li each={ children } riot-tag="coleccion-item"></li>
	</ul>

	<script>
		var me = this;

		goto(event) {
			var href = this.href;

			env.cur_coleccion.load(href)
				.then(function() {
					env.coleccion_lista.update()
					env.cur_coleccion.trigger('actualizarTagHeader');
			});
		}
	</script>
</coleccion-item>
