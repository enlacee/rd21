<anb-coleccion>
	<ul id="anb_coleccion_id">
		<li each={collections} class="" onclick={parent.goto}>
			{this.name} : {this.href}
			{console.log('_this_', this)}
			<!-- como aplico la recursividad en la listas y sublistas -->
		</li>
	</ul>

	<script>
		var me = this;
		console.log('anb_coleccion', env.anb_coleccion);

		//(3) cargar objeto de ayuda (marcar en negrita) (evento click)
		goto(e) {
			env.anb_cur_collection.load(e.item.href)
				.then(function() {
				me.update(); // update
				console.log('dta.ok', env.anb_cur_collection);
				});
		}

		//(2) construcion del callback a llamar ()
		env.anb_coleccion.on('updated', function(status) {
			me.collections = this.collections;
			me.update();

		})

		//(1) start
		env.anb_coleccion.load();
	</script>
</anb-coleccion>
