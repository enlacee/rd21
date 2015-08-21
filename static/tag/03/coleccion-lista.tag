<coleccion-lista>
	<ul>
		<li each={colecciones} riot-tag="coleccion-item"></li>
	</ul>

	<button onclick={reload}>cargar</button>
	<script>
		var tag = this;
		env.add('tag-coleccion-lista', this)

		reload(e) {
			env.colecciones.load();
		}

		env.colecciones.on('updated', function(status){
			tag.colecciones = this.collections;
			tag.update();
		});

		//start
		env.colecciones.load();
	</script>
</coleccion-lista>
