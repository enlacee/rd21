<!-- TAG-coleccion-lista -->
<coleccion-lista>
	<ul>
		<li each={ colecciones } riot-tag="coleccion-item"></li>
	</ul>
	<script>
		var me = this;
		me.colecciones = [];
		env.add('coleccion_lista', me);

		env.coleccion_lista.on('render', function(objeto) {
			me.colecciones = objeto.data.collections;
			me.update();
		});
	</script>
</coleccion-lista>




<!-- ---------------------------------------------------------------------- -->
<!-- TAG-coleccion-item -->
<coleccion-item>
	<span onclick={ goto } class="{ selected: this.href == env.cur_coleccion.href }">
		{ name }
	</span>
	<ul>
		<li each={ children } riot-tag="coleccion-item"></li>
	</ul>

	<script>
	var tag = this;

	goto(event) {
		env.cur_coleccion.traerDatos(this.href);
	}
	</script>
	<style scoped>
		.selected {
			font-weight:bold;
		}
	</style>
</coleccion-item>
